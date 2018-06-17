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

//`include "../serial2parallel.v"
`include "../decoder.v"

module testbench;
  reg  wReset, w1b;
  reg wClockTeclado;
  reg Clock;
  wire wError;
  wire [10:0] w11b;
  wire [7:0] wKey;
  reg tecla;
  reg [7:0] oLed;

	MiniAlu uut (
		.Clock(Clock), 
		.Reset(wReset), 
		.oLed(oLed),
		.PS2_DATA(w1b),
		.PS2_CLK(wClockTeclado)
	);
  always #5 Clock = ~Clock;	
  always #20000 wClockTeclado = ~(wClockTeclado & tecla);

  initial begin
    tecla <= 0;
    wReset <= 0;
    w1b <= 1;
    wClockTeclado <= 1;
	 Clock <= 1;
    #10 wReset <= 1;
    #20 wReset <= 0;

    #159990 w1b <= 0;//inicia
    #10 wClockTeclado <= 0; tecla <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 0;
    #40000 w1b <= 1;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 1; //termina 011010001 11 --> 3
    tecla <= 0;

    #159990 w1b <= 0;//inicia
    #10 wClockTeclado <= 0; tecla <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 1;
    #40000 w1b <= 1; //termina 011110000 11 --> 3
    tecla<=0;

    #159990 w1b <= 0;//inicia
    #10 wClockTeclado <= 0; tecla <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 0;
    #40000 w1b <= 1;
    #40000 w1b <= 1; //termina 010000110 11 --> 2 (error de paridad forzado)
    tecla<=0;
    #2200000;
    $finish;
  end
endmodule //testbench


/*module TestBench;

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

endmodule*/
