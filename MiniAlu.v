
`timescale 1ns / 1ps
`include "Defintions.v"


module MiniAlu
(
 input wire Clock,
 input wire Reset,
 output wire [7:0] oLed,
 input wire PS2_DATA,
 input wire PS2_CLK

 
);

wire [15:0]  wIP,wIP_temp;
reg         rWriteEnable,rBranchTaken;
wire [27:0] wInstruction;
wire [3:0]  wOperation;
reg [15:0]   rResult;
wire [7:0]  wSourceAddr0,wSourceAddr1,wDestination;
wire [15:0] wSourceData0,wSourceData1,wIPInitialValue,wImmediateValue;

reg rRetTaken, rCallTaken;

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

assign wIPInitialValue = (Reset) ? 8'b0 : wDestination;
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
	.Q( oLed    )
);

/*wire [15:0] multemp;
Mul2LUT MuL2
(	.B(wSourceData0),
	.A(wSourceData1),
	.C(multemp)
);*/


assign wImmediateValue = {wSourceAddr1,wSourceAddr0};

wire CLK_cnt;
wire slowCLK;
assign slowCLK = CLK_cnt;

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
	/*`MUL2:
	begin
		rWriteEnable <= 1'b1;
		rResult      <= multemp;
	end*/
	//-------------------------------------
		rResult      <= wSourceData1 - wSourceData0;
	end
	//-------------------------------------
  `MUL:
	begin
		rWriteEnable <= 1'b1;
		rResult      <= wResult;
	end
	//-------------------------------------
	`STO:
	begin
		rWriteEnable <= 1'b1;
		rBranchTaken <= 1'b0;
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
	`LED:
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
	
	`TEC:
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
		rResult      <= 0;
	end
	//-------------------------------------
	default:
	begin
	  // drive_defaults;
	end
	//-------------------------------------
	endcase
end

task drive_defaults;
	begin
	   rFFLedEN     <= 1'b0;
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
