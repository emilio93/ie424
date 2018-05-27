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

module TestBenchVGA;


   reg clk;
	reg rst;

	// Inputs
	reg [2:0] data;
	reg [18:0] ctrH, ctrV;

	// Outputs
	wire [2:0] colorChannels;
	wire hSync;
	wire vSync;

	// Instantiate the Unit Under Test (UUT)
	VGA vga (
	   .clk(clk),
		.rst(rst),
		.data(data),
		.oCtrH(ctrH), 
		.oCtrV(ctrV),
		.colorChannels(colorChannels),
		.oHSync(hSync),
		.oVSync(vSync)
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

      data <= 3'b000;
		// Add stimulus here

	end

endmodule
