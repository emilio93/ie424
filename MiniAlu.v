
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
reg          rWriteEnable,rBranchTaken; //habilitadores
wire [27:0]  wInstruction; //instruccion compuesta por concatenacion
wire [3:0]   wOperation; //OPCODE
reg  [15:0]  rResult; //Salida de la ALU
wire [7:0]   wSourceAddr0,wSourceAddr1,wDestination; //Entradas de la RAM
wire [15:0]  wSourceData0,wSourceData1,wIPInitialValue,wImmediateValue; //Entradas de la ALU y RAM
reg rWriteLCD; //Habilitador de la pantalla para escribir. Indica que se esta escribiendo.
wire wready;
wire wIsInitialized;

reg rModulesLoaded;// indica si ya todos los modulos han sido inicializados y están listos

wire [15:0]  wIP,wIP_temp;
reg          rWriteEnable,rBranchTaken, rRetTaken, rCallTaken;
wire [27:0]  wInstruction;
wire [3:0]   wOperation;
wire [7:0]   wSourceAddr0,wSourceAddr1,wDestination;
wire [15:0]  wSourceData0,wSourceData1,wIPInitialValue,wImmediateValue;
reg [15:0]  rResult,wResult;

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

assign wIPInitialValue = (rCallTaken) ?  wDestination :
                         (rRetTaken)  ?  wSourceData0 :
                         (Reset) ? 8'b0 : wDestination;
assign wIPInitialValue = (rBranchTaken&wready) ? wDestination :
                         (rBranchTaken) ? wDestination :
                         (!rModulesLoaded) ? 8'b0 :
                         (!wready) ? wIP_temp-1 :
                         wDestination;
UPCOUNTER_POSEDGE IP
(
.Clock(   Clock                ),
.Reset(   Reset | rBranchTaken | rCallTaken | rRetTaken),
.Initial( (rCallTaken) ? wIP+1 : 
          (rRetTaken) ? wIP+1: 
			 wIPInitialValue + 1  ),
.Reset(   !rModulesLoaded | rBranchTaken | !wready),
.Initial( wIPInitialValue + 1  ),
.Enable(  1'b1                 ),
.Q(       wIP_temp             )
);
assign wIP = (rCallTaken) ? wIPInitialValue:
             (rRetTaken) ? wIPInitialValue:
				 (rBranchTaken) ? wIPInitialValue : wIP_temp;

// wOperation
FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FFD1 
assign wIP = (rBranchTaken&wready) ? wIPInitialValue :
             (rBranchTaken) ? wIPInitialValue :
             (!rModulesLoaded) ? 0 :
             (!wready) ? wIPInitialValue :
             wIP_temp;

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
	case (wOperation)
	//-------------------------------------
	`NOP:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
		rCallTaken <= 1'b0;
		rRetTaken <= 1'b0;
		rWriteEnable <= 1'b0;
		rResult      <= 0;
    rWriteLCD <= 1'b0;
	end
	//-------------------------------------
	`ADD:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
		rWriteEnable <= 1'b1;
		rCallTaken <= 1'b0;
		rResult      <= wSourceData1 + wSourceData0;
    rWriteLCD <= 1'b0;
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
		rResult      <= wSourceData1 - wSourceData0;
    rWriteLCD <= 1'b0;
	end
	//-------------------------------------
  `MUL:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
		rWriteEnable <= 1'b1;
		rCallTaken <= 1'b0;
		rResult      <= wResult;
	end
	//-------------------------------------
	`MUL16BITS:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
		rWriteEnable <= 1'b1;
		rCallTaken <= 1'b0;
		rResult      <= mul16BitResult;
	end
	//-------------------------------------
	//-------------------------------------
	`MUL2:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
		rWriteEnable <= 1'b1;
		rCallTaken <= 1'b0;
		rResult      <= multemp;
	end
	//-------------------------------------
	`MUL4:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
		rWriteEnable <= 1'b1;
		rCallTaken <= 1'b0;
		rResult      <= mul4temp;
	end
	//-------------------------------------
	`STO:
	begin
		rFFLedEN     <= 1'b0;
		rWriteEnable <= 1'b1;
		rBranchTaken <= 1'b0;
		rCallTaken <= 1'b0;
		rResult      <= wImmediateValue;
    rWriteLCD <= 1'b0;
	end
	//-------------------------------------
	`BLE:
	begin
		rFFLedEN     <= 1'b0;
		rWriteEnable <= 1'b0;
		rResult      <= 0;
		rCallTaken <= 1'b0;
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
	end
	//-------------------------------------	
	`CALL:
	begin
		rFFLedEN     <= 1'b0;
		rWriteEnable <= 1'b1;
		rResult      <= wIP_temp;
		rCallTaken <= 1'b1;
	end
	//-------------------------------------	
	`RET:
	begin
		rFFLedEN     <= 1'b0;
		rWriteEnable <= 1'b0;
		rResult      <= 0;
		rRetTaken <= 1'b1;
		rCallTaken <= 1'b0;
	end
	//-------------------------------------	
	`LED:
	begin
		rFFLedEN     <= 1'b1;
		rWriteEnable <= 1'b0;
		rResult      <= 0;
		rBranchTaken <= 1'b0;
		rCallTaken <= 1'b0;
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
	end	
	//-------------------------------------	
	endcase	
end


endmodule
