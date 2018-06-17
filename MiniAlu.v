
`timescale 1ns / 1ps
`include "Defintions.v"
`include "LCD.v"
`include "VGA.v"


module MiniAlu
(
 input wire Clock,
 input wire Reset,
 output wire [7:0] oLed,
 input wire PS2_DATA,
 input wire PS2_CLK

 
 output wire [11:8] SF_D,
 output wire LCD_E,
 output wire LCD_RS,
 output wire LCD_RW,
 output wire No_se,
 output wire VGA_RED,
 output wire VGA_GREEN,
 output wire VGA_BLUE,
 output wire VGA_VS,
 output wire VGA_HS
);

wire [15:0]  wIP,wIP_temp;
reg         rWriteEnable,rBranchTaken;
wire [27:0] wInstruction;
wire [3:0]  wOperation;
reg [15:0]   rResult;
wire [7:0]  wSourceAddr0,wSourceAddr1,wDestination;
wire [15:0] wSourceData0,wSourceData1,wIPInitialValue,wImmediateValue;

reg rRetTaken, rCallTaken;

reg rModulesLoaded;// indica si ya todos los modulos han sido inicializados y están listos

reg         rRetTaken, rCallTaken; // Flags para llamadas a RET y CALL
reg [15:0]  wResult;

always @ (*) begin
  rModulesLoaded = wIsInitialized;
end


// Generación de clock a 25MHz
reg clk25;
always @ (posedge Clock or posedge Reset) begin
  if (Reset) clk25<=0;
  else clk25<=clk25+1'b1; // 0+1=1, 1+1=0, 0+1=1, ...
end

wire [2:0] VGAOut;      // Dato solicitado para mostrar en pixel
wire [10:0] ctrH, ctrV; // Posición del controlador vga(0 en tiempos de inactividad)

// Controlador VGA
VGA vga(
  .clk(clk25),
  .rst(~rModulesLoaded),
  .rgb(VGAOut),
  .oCtrH(ctrH),
  .oCtrV(ctrV),
  .RED(VGA_RED),
  .GREEN(VGA_GREEN),
  .BLUE(VGA_BLUE),
  .HS(VGA_HS),
  .VS(VGA_VS)
);

wire [3:0] vgaramh, vgaramv; // posicion horizontal, vertical para memoria vga

// Adaptador de controlador VGA a memoria
VGAAdapter vgaadapter(
	.widthPos(ctrH),
	.heightPos(ctrV),
	.widthMin(vgaramh),
	.heightMin(vgaramv)
);

reg VGAWrite;               // senal para habilitar escritura en memoria de video
reg [7:0] rVGAWriteAddress; // posición de memoria de video para escribir

// Memoria de video
// el primer parametro indica que se trabaja con datos de 3 bits que forman un color
// el segundo parametro indica que las direcciones son de 8 bits, esto limita el tamaño
//   de la memoria a 2^8 datos de 3(o n) bits. Este tamaño se puede ampliar hasta con
//   16 bits, el tamaño de los datos en los registros, correspondería a un máximo de
//   65536 datos.
// el tercer parametro es el tamaño de la memoria
// notese que el dato de lectura corresponde a la cantidad de datos horizontales por
//   la posición de linea vertical más la posición horizontal.
parameter VGA_DATA_WIDTH=3;
parameter VGA_ADDR_WIDTH=8;
parameter VGA_MEM_WIDTH=16;
parameter VGA_MEM_HEIGHT=12;
parameter VGA_MEM_SIZE=VGA_MEM_WIDTH*VGA_MEM_HEIGHT;
VGARam # (VGA_DATA_WIDTH, VGA_ADDR_WIDTH, VGA_MEM_SIZE )
vgaram (
  .Clock(Clock),
  .iWriteEnable(VGAWrite),
  .iReadAddress(VGA_MEM_WIDTH*vgaramv+vgaramh),
  .iWriteAddress(rVGAWriteAddress),
  .iDataIn(wResult),
  .oDataOut(VGAOut)
);

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
	.iDataIn(       rResult      ),
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
                         (!wready) ? wIP_temp-1:
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
.Reset(   Reset | rBranchTaken ),
.Initial( wIPInitialValue + 1  ),
.Enable(  1'b1                 ),
.Q(       wIP_temp             )
);
assign wIP = (rBranchTaken) ? wIPInitialValue : wIP_temp;

FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FFD1 
(
	.Clock(Clock),
  .Reset(!rModulesLoaded),
	.Enable(1'b1),
	.D(wInstruction[27:24]),
	.Q(wOperation)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FFD2
(
	.Clock(Clock),
  .Reset(!rModulesLoaded),
	.Enable(1'b1),
	.D(wInstruction[7:0]),
	.Q(wSourceAddr0)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FFD3
(
	.Clock(Clock),
  .Reset(!rModulesLoaded),
	.Enable(1'b1),
	.D(wInstruction[15:8]),
	.Q(wSourceAddr1)
);

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
	.D( wSourceData1 ),
  .Q( oLed )
);

/*wire [15:0] multemp;
Mul2LUT MuL2
(	.B(wSourceData0),
	.A(wSourceData1),
	.C(multemp)
);*/


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
  .oLCD_Data(SF_D[11:8]),
  .oIsInitialized(wIsInitialized),
  .ready(wready)
  );

UPCOUNTER_POSEDGE #(1) CLK25 
(
.Clock(   Clock                ),
.Reset(   Reset ),
.Initial( 1'd0 ),
.Enable(  1'b1                 ),
.Q(       CLK_cnt             )
);

reg [7:0] ClockFilter;
reg ClockTeclado;
reg [7:0] DataFilter;
reg ibData;
always @ (posedge slowCLK) begin
  ClockFilter <= {PS2_CLK, ClockFilter[7:1]};
  if (ClockFilter == 8'hFF) ClockTeclado = 1'b1;
  if (ClockFilter == 8'd0) ClockTeclado = 1'b0;
  DataFilter <= {PS2_DATA, DataFilter[7:1]};
  if (DataFilter == 8'hFF) ibData = 1'b1;
  if (DataFilter == 8'd0) ibData = 1'b0;
end
  
wire [7:0] wKey;  
serial2parallel s2p(.iReset(Reset), .i1b(ibData), .o8b(wKey), .ClockTeclado(ClockTeclado));

always @ ( * )
begin
  drive_defaults;
	case (wOperation)
	//-------------------------------------
	`NOP:
	begin
	   // drive_defaults;
		rBranchTaken <= 1'b0;
		rWriteEnable <= 1'b0;
		rResult      <= 0;
	end
	//-------------------------------------
	`ADD:
	begin
		rWriteEnable <= 1'b1;
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
		rWriteEnable <= 1'b1;
		rResult      <= wSourceData1 - wSourceData0;
	end
	//-------------------------------------
  `MUL:
	begin
		rWriteEnable <= 1'b1;
		rResult      <= wSourceData1 * wSourceData0;
	end
	//-------------------------------------
	`STO:
	begin
		rWriteEnable <= 1'b1;
		rResult      <= wImmediateValue;
	end
	//-------------------------------------
	`BLE:
	begin
		rResult      <= 0;
		if (wSourceData1 <= wSourceData0 )
			rBranchTaken <= 1'b1;
		else
			rBranchTaken <= 1'b0;
		
	end
	//-------------------------------------	
	`JMP:
	begin
		rResult      <= 0;
		rBranchTaken <= 1'b1;
	end
	//-------------------------------------	
  //
  // CALL, SUBRUTINA, 16'b0
  //
  // Operación CALL llama a una subrutina, guardando automaticaente la
  // dirección de retorno en el registro `RA,
  `CALL:
	begin
		rWriteEnable <= 1'b1;
		rResult      <= wIP_temp;
		rCallTaken <= 1'b1;
	end
	//-------------------------------------
	//
	// RET, 16'b0, RA
	// Regresa a la direccion de retorno
	//
	`RET:
	begin
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
		rPushStackEnable <= 1'b1;
		rResult      <= 0;
	end
  //-------------------------------------
  //
  // POP, R1, 16'b0
  // Saca el ultimo dato del stack y lo pone en R1
  `POP:
	begin
		rWriteEnable <= 1'b1;
		rPopStackEnable <= 1'b1;
		rResult      <= wStackOut;
	end
	//-------------------------------------
	`LED:
	begin
		rFFLedEN     <= 1'b1;
		rResult      <= 0;
	end
	//-------------------------------------
  `LCD:
	begin
    rWriteLCD <= 1'b1;
    rResult      <= wSourceData0;
  end

  // VGA, 8'b0, R1, R2
  // Coloca el dato en R1 en la posición de memoria en R2
  // Se puede utilizar la siguiente subrutina para escritura
  // en una posicion
  //
  // //
  // // LE ENTRA R10, R11, R12, R13 y R14
  // // PONE EL COLOR INDICADO EN R10
  // // EN LA POSICIÓN R11, R12
  // // R13 ES EL LIMITE HORIONTAL
  // // R14 ES EL LIMITE VERTICAL
  // // _______________________
  // // |
  // // | 0X0 1X0 2X0 ... nX0
  // // | 0x1 1x1 2x1 ... nx1
  // // |  .   .   . .     .
  // // |  .   .   .    .  .
  // // |  .   .   .       .
  // // | 0xm 1xm 2xm ... nxm
  // // |_____________________
  // //
  // // ______________________
  // // |
  // // | 0+0n 1+0n 2+0n ... (n-1)+0n
  // // | 0+1n 1+1n 2+1n ... (n-1)+1n
  // // | 0+2n 1+2n 2+2n ... (n-1)+2n
  // // |  .    .    .  .     .
  // // |  .    .    .     .  .
  // // |  .    .    .        .
  // // | 0+mn 1+mn 2+mn  ... (n-1)+nm
  // // |_____________________
  // //
  // // R2 = R11 + R12 * R13
  // DISPLAY:
  //   NOP, 24'b0
  //   PUSH, 16'b0, RA
  //   PUSH, 16'b0, R2

  //   NOP, 24'b0
  //   MUL, R2, R12, R13
  //   NOP, 24'b0
  //   ADD, R2, R2, R11

  //   NOP, 24'b0
  //   VGA, 8'b0, R10, R2

  //   POP, R2, 16'b0
  //   POP, RA, 16'b0
  //   NOP, 24'b0
  //   RET, 16'b0, RA
  `VGA:
  begin
    VGAWrite <= 1'b1; // habilitar escritura en memoria de video
    wResult <= wSourceData1; //
    rVGAWriteAddress <= wSourceData0;
  end
  //-------------------------------------
  default:
	begin
	  // drive_defaults;
	end
	//-------------------------------------
  endcase
end

// Aca se puede agregar los valores por defecto para
// los distintos regs utilizados,
task drive_defaults;
  begin
    rVGAWriteAddress <= 1'b0;
    rFFLedEN <= 1'b0;
    rWriteEnable <= 1'b0;
    rWriteLCD <= 1'b0;
		rPushStackEnable <= 0;
		rPopStackEnable <= 0;
    rCallTaken <= 1'b0;
    rRetTaken <= 1'b0;
    rBranchTaken <= 1'b0;
    VGAWrite <= 1'b0;      // por lo general no se escribe en memoria de video
  end
endtask

endmodule
