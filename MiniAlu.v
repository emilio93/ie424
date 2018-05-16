
`timescale 1ns / 1ps
`include "Defintions.v"
//`include "LCD.v"
//`include "TestBench_LCD.v"


module MiniAlu
(
 input wire Clock,
 input wire Reset
);

wire [15:0]  wIP,wIP_temp;
reg          rWriteEnable,rBranchTaken;
wire [27:0]  wInstruction;
wire [3:0]   wOperation;
reg  [15:0]  rResult;
wire [7:0]   wSourceAddr0,wSourceAddr1,wDestination;
wire [15:0]  wSourceData0,wSourceData1,wIPInitialValue,wImmediateValue;
wire iLCD_Ready;

reg rWriteLCD;


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
	.iWriteAddress( wDestination ),
	.iDataIn(       rResult      ),
	.oDataOut0(     wSourceData0 ),
	.oDataOut1(     wSourceData1 )
);

assign wIPInitialValue = (Reset) ? 8'b0 :
                         (!oLCD_Ready) ? wIP :
                         wDestination;
UPCOUNTER_POSEDGE IP
(
.Clock(   Clock                ),
.Reset(   Reset | rBranchTaken | (!iLCD_Ready)),
.Initial( wIPInitialValue + 1  ),
.Enable(  1'b1                 ),
.Q(       wIP_temp             )
);
assign wIP = (rBranchTaken) ? wIPInitialValue :
             (iLCD_Ready) ? wIP_temp :
             (wIP_temp-1);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FFD1
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(wInstruction[27:24]),
	.Q(wOperation)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FFD2
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(wInstruction[7:0]),
	.Q(wSourceAddr0)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FFD3
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(wInstruction[15:8]),
	.Q(wSourceAddr1)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FFD4
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(wInstruction[23:16]),
	.Q(wDestination)
);


reg rFFLedEN;
FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FF_LEDS
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable( rFFLedEN ),
	.D( wSourceData1 ),
	.Q( oLed )
);

assign wImmediateValue = {wSourceAddr1,wSourceAddr0};

LCD LSD(
  .Clock(Clock),
  .Reset(Reset),
  .write_Enabled(rWriteLCD),
  .Data(wSourceData1),
  .oLCD_Enabled(LCD_E),
  .oLCD_RegisterSelect(LCD_RS), //Command = 0, Data = 1
  .oLCD_StrataFlashControl(),
  .oLCD_ReadWrite(LCD_RW),
  .oLCD_Data(SF_D[11:8]),
  .oLCD_Ready(iLCD_Ready)
  );


always @ ( * )
begin
	case (wOperation)
	//-------------------------------------
	`NOP:
	begin
		rFFLedEN     <= 1'b0;
		rBranchTaken <= 1'b0;
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
		rResult      <= wSourceData1 - wSourceData0;
    rWriteLCD <= 1'b0;
	end
	//-------------------------------------
	`STO:
	begin
		rFFLedEN     <= 1'b0;
		rWriteEnable <= 1'b1;
		rBranchTaken <= 1'b0;
		rResult      <= wImmediateValue;
    rWriteLCD <= 1'b0;
	end
	//-------------------------------------
	`BLE:
	begin
		rFFLedEN     <= 1'b0;
		rWriteEnable <= 1'b0;
		rResult      <= 0;
    rWriteLCD <= 1'b0;
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
    rWriteLCD <= 1'b0;
	end
	//-------------------------------------
	`LED:
	begin
		rFFLedEN     <= 1'b1;
		rWriteEnable <= 1'b0;
		rResult      <= 0;
		rBranchTaken <= 1'b0;
    rWriteLCD <= 1'b0;
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
    rWriteLCD <= 1'b0;
	end
	//-------------------------------------
	endcase
end


endmodule
