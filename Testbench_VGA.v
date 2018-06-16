`timescale 20ns / 10ns
`include "LCD.v"
`include "VGA.v"

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

module TestBenchVGA;

   reg clk;
	reg rst;

	// Inputs
	wire [3:0] SF_D;
	wire LCD_E;
	wire LCD_RS;
	wire LCD_RW;
	wire No_se;

	// Outputs
	wire  VGA_RED, VGA_GREEN, VGA_BLUE;
	wire [18:0] ctrH, ctrV;
	wire VGA_VS;
	wire VGA_HS;
	
	wire [2:0] dataOut;
	
		// Instantiate the Unit Under Test (UUT)
	MiniAlu uut (
		.Clock(clk),
		.Reset(rst),
		.SF_D(SF_D),
		.LCD_E(LCD_E),
		.LCD_RS(LCD_RS),
		.LCD_RW(LCD_RW),
		.No_se(No_se),
		.VGA_RED(VGA_RED),
		.VGA_BLUE(VGA_BLUE),
		.VGA_GREEN(VGA_GREEN),
		.VGA_VS(VGA_VS),
		.VGA_HS(VGA_HS)
	);

	always
	begin
		#1  clk = !clk;

	end

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		// Wait 100 ns for global reset to finish
		#100;
		rst = 1;
		#50
		rst = 0;
   end

endmodule
