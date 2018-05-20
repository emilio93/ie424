`timescale 1ns / 1ns
`include "LCD.v"
////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   22:30:52 01/30/2011
// Design Name:   MiniAlu
// Module Name:   D:/Proyecto/RTL/Dev/MiniALU/TestBench.v
// Project Name:  MiniALU
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: MiniAlu
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module TestBench;

	// Inputs
	reg Clock;
	reg Reset;

	// Outputs
	wire [3:0] oData;
	wire enb;
	wire RegSelect;
	wire StrataFlashFCtrl;
	wire ReadWrite;
	wire [3:0] SF_D;
	wire LCD_E;
	wire LCD_RS;
	wire LCD_RW;
	wire No_se;

	// Instantiate the Unit Under Test (UUT)
	MiniAlu uut (
		.Clock(Clock),
		.Reset(Reset),
		.SF_D(SF_D),
		.LCD_E(LCD_E),
		.LCD_RS(LCD_RS),
		.LCD_RW(LCD_RW),
		.No_se(No_se)
	);

	always
	begin
		#1  Clock =  ! Clock;

	end

	initial begin
		// Initialize Inputs
		Clock = 0;
		Reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		Reset = 1;
		#50
		Reset = 0;

		// Add stimulus here

	end

endmodule
