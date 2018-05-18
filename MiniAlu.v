
`timescale 1ns / 1ps
//`include "LCD.v"
//`include "TestBench_LCD.v"

`include "Defintions.v"
`include "LCD.v"

module MiniAlu
(
 input wire Clock,
 input wire Reset,
 output wire [7:0] oLed,
 output wire [3:0] SF_D,
 output wire LCD_E,
 output wire LCD_RS,
 output wire LCD_RW,
 output wire No_se
);

wire [15:0]  wIP,wIP_temp; //PC counter
wire [15:0]  wStackOut;
reg          rWriteEnable,rBranchTaken; //habilitadores
reg          rPushStackEnable, rPopStackEnable; //habilitadores para actuar en el es stack
wire [27:0]  wInstruction; //instruccion compuesta por concatenacion
wire [3:0]   wOperation; //OPCODE
reg  [15:0]  rResult; //Salida de la ALU
wire [7:0]   wSourceAddr0,wSourceAddr1,wDestination; //Entradas de la RAM
wire [15:0]  wSourceData0,wSourceData1,wIPInitialValue,wImmediateValue; //Entradas de la ALU y RAM
reg rWriteLCD; //Habilitador de la pantalla para escribir. Indica que se esta escribiendo.

wire wready; // Lcd está lista para recibir comandos.
wire wIsInitialized; // Indica que máquina de estados de la lcd ha sido inicializada.

reg rModulesLoaded;// indica si ya todos los modulos han sido inicializados y están listos

reg         rRetTaken, rCallTaken; // Flags para llamadas a RET y CALL
reg [15:0]  wResult;

always @ (*) begin
  rModulesLoaded = wIsInitialized;
end

ROM InstructionRom
(
	.iAddress(     wIP          ),
	.oInstruction( wInstruction )
);

RAM_DUAL_READ_PORT DataRam
(
	.Clock(         Clock        ),
	.iWriteEnable(  rWriteEnable ),
	.iReadAddress0( wInstruction[7:0] ),
	.iReadAddress1( wInstruction[15:8] ),
	.iWriteAddress( rCallTaken ? `RA : wDestination ),
	.iDataIn(       rResult ),
	.oDataOut0(     wSourceData0 ),
	.oDataOut1(     wSourceData1 )
);

Stack Stack
(
	.Clock(Clock),
	.Reset(!rModulesLoaded),
  .write(rPushStackEnable),
  .read(rPopStackEnable),
  .setSP(1'b0),
  .stackPointerIn(6'b0),
	.iDataIn(wSourceData0),
	.oDataOut(wStackOut)
);


// El valor que, se resetea y está disponible para el contador de instrucción wIP
//
// Se toma wDestination, esto es, el primer argumento de la operación, cuando se
// ha realizado una operación CALL o BLE
//
// Se toma wSourceData0, esto es, el segundo argumento de la operación, cuando se
// tiene una operación RET
//
// Para todo lo demás, se toma wDestination
assign wIPInitialValue = (!rModulesLoaded) ? 8'b0 :
                         (rCallTaken | rBranchTaken&wready | rBranchTaken) ?  wDestination :
                         (rRetTaken)  ?  wSourceData0 :
                         wDestination;

// El flip flop del contador de instrucciones se resetea cuando se tiene alguna
// de las siguentes señales :
//   !rModulesLoaded : Esta es la señal de !reset, cuando esta baja no se han inicializado
//                     los módulos de la minialu(la fsm de LCD). Cuando la señal está en alto
//                     indica todos los módulos están listos. Se inicializa en
//   rBranchTaken    : Cuando se realiza un salto mediante la operación BLE
//   rCallTaken      : Cuando se realiza un salto mediante la operación CALL
//   rRetTaken       : Cuando se realiza un salto mediante la operación RET
//   !wready         : Cuando la lcd está procesando una accion. Mantiene su posición.
//
UPCOUNTER_POSEDGE IP
(
.Clock(   Clock                ),
.Reset(   !rModulesLoaded | rBranchTaken | rCallTaken | rRetTaken | !wready),
.Initial( (!wready) ? wIP:
			    wIPInitialValue + 1  ),
.Enable(  1'b1                 ),
.Q(       wIP_temp             )
);

// wIP es el número de instrucción que se ejecuta
// asigna el valor de la instrucción ejecutada
// según el caso
assign wIP = (!rModulesLoaded) ? 0 :
             (rBranchTaken&wready) ? wIPInitialValue :
             (rBranchTaken | rCallTaken | rRetTaken) ? wIPInitialValue :
             (!wready) ? wIPInitialValue :
             wIP_temp;

// wOperation
FFD_POSEDGE_SYNCRONOUS_RESET # ( 4 ) FFD1
(
	.Clock(Clock),
	.Reset(!rModulesLoaded),
	.Enable(1'b1),
	.D(wInstruction[27:24]),
	.Q(wOperation)
);

// wSourceAddr0
FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FFD2
(
	.Clock(Clock),
	.Reset(!rModulesLoaded),
	.Enable(1'b1),
	.D(wInstruction[7:0]),
	.Q(wSourceAddr0)
);

// wSourceAddr1
FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FFD3
(
	.Clock(Clock),
	.Reset(!rModulesLoaded),
	.Enable(1'b1),
	.D(wInstruction[15:8]),
	.Q(wSourceAddr1)
);

// wDestination
FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FFD4
(
	.Clock(Clock),
	.Reset(!rModulesLoaded),
	.Enable(1'b1),
	.D(wInstruction[23:16]),
	.Q(wDestination)
);


reg rFFLedEN;
FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FF_LEDS
(
	.Clock(Clock),
	.Reset(!rModulesLoaded),
	.Enable( rFFLedEN ),
	.D( wSourceData1[7:0]),
	.Q( oLed )
);

assign wImmediateValue = {wSourceAddr1,wSourceAddr0};

LCD LSD(
  .Clock(Clock),
  .Reset(Reset),
  .write_Enabled(rWriteLCD),
  .iData(wSourceData1[7:0]),
  .oLCD_Enabled(LCD_E),
  .oLCD_RS(LCD_RS), //Command = 0, Data = 1
  .oLCD_RW(LCD_RW),
  .oLCD_StrataFlashControl(No_se),
  .oLCD_Data(SF_D[3:0]),
	.oIsInitialized(wIsInitialized),
  .ready(wready)
  );


always @ ( * )
begin
	drive_defaults;
	case (wOperation)
	//-------------------------------------
	`NOP:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
		rCallTaken <= 1'b0;
		rRetTaken <= 1'b0;
		rWriteEnable <= 1'b0;
		rRetTaken <= 1'b0;
		rResult      <= 0;
	end
	//-------------------------------------
	`ADD:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
		rWriteEnable <= 1'b1;
		rCallTaken <= 1'b0;
		rRetTaken <= 1'b0;
		rResult      <= wSourceData1 + wSourceData0;
	end
	//-------------------------------------
	// Operación de resta.
	// No se altera el número mostrado con
	// los leds.
	// Guarda un dato en un registro, este dato
	// es la diferencia del dato wSourceData1 y
	// el dato wSourceData0.
	// eg
	//   SUB t1,t2,t3 # t1=t2-t3
	`SUB:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
		rWriteEnable <= 1'b1;
		rCallTaken <= 1'b0;
		rRetTaken <= 1'b0;
		rResult      <= wSourceData1 - wSourceData0;
	end
	//-------------------------------------
  `MUL:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
		rWriteEnable <= 1'b1;
		rCallTaken <= 1'b0;
		rRetTaken <= 1'b0;
		rResult      <= wResult;
	end
	//-------------------------------------
	`STO:
	begin
		rFFLedEN     <= 1'b0;
		rWriteEnable <= 1'b1;
		rBranchTaken <= 1'b0;
		rCallTaken <= 1'b0;
		rRetTaken <= 1'b0;
		rResult      <= wImmediateValue;
	end
	//-------------------------------------
	`BLE:
	begin
		rFFLedEN     <= 1'b0;
		rWriteEnable <= 1'b0;
		rResult      <= 0;
		rCallTaken <= 1'b0;
		rRetTaken <= 1'b0;
		if (wSourceData1 <= wSourceData0 )
			rBranchTaken <= 1'b1;
		else
			rBranchTaken <= 1'b0;

	end
	//-------------------------------------
	`JMP:
	begin
		rFFLedEN     <= 1'b0;
		rWriteEnable <= 1'b0;
		rResult      <= 0;
		rBranchTaken <= 1'b1;
		rCallTaken <= 1'b0;
		rRetTaken <= 1'b0;
	end
	//-------------------------------------
	//
	// CALL, SUBRUTINA, 16'b0
	//
	// Operación CALL llama a una subrutina, guardando automaticaente la
	// dirección de retorno en el registro `RA,
	`CALL:
	begin
		rFFLedEN     <= 1'b0;
		rWriteEnable <= 1'b1;
		rResult      <= wIP_temp;
		rCallTaken <= 1'b1;
		rRetTaken <= 1'b0;
	end
	//-------------------------------------
	//
	// RET, 16'b0, RA
	// Regresa a la direccion de retorno
	//
	`RET:
	begin
		rFFLedEN     <= 1'b0;
		rWriteEnable <= 1'b0;
		rResult      <= 0;
		rRetTaken <= 1'b1;
	end
	//-------------------------------------
	//
	// PUSH, 16'b0, R1
	// Inserta el dato en R1 en el stack
	//
	`PUSH:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
		rPushStackEnable <= 1'b1;
		rResult      <= 0;
	end
	//-------------------------------------
	//
	// POP, R1, 16'b0
	// Saca el ultimo dato del stack y lo pone en R1
	`POP:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
		rWriteEnable <= 1'b1;
		rPopStackEnable <= 1'b1;
		rResult      <= wStackOut;
	end
	//-------------------------------------
	`LED:
	begin
		rFFLedEN     <= 1'b1;
		rWriteEnable <= 1'b0;
		rResult      <= 0;
		rBranchTaken <= 1'b0;
		rCallTaken <= 1'b0;
		rRetTaken <= 1'b0;
	end
	//-------------------------------------
  `LCD:
	begin
		rFFLedEN     <= 1'b0;
		rWriteEnable <= 1'b0;
    rWriteLCD <= 1'b1;
		rResult      <= 0;
		rBranchTaken <= 1'b0;
	end
	//-------------------------------------
	default:
	begin
		rFFLedEN     <= 1'b1;
		rWriteEnable <= 1'b0;
		rResult      <= 0;
		rBranchTaken <= 1'b0;
		rCallTaken <= 1'b0;
		rRetTaken <= 1'b0;
	end
	//-------------------------------------
	endcase
end

task drive_defaults;
	begin
		rWriteEnable <= 1'b0;
    rWriteLCD <= 1'b0;
		rPushStackEnable <= 0;
		rPopStackEnable <= 0;
		rCallTaken <= 1'b0;
		rRetTaken <= 1'b0;
		rBranchTaken <= 1'b0;
	end
endtask


endmodule
