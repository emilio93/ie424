`timescale 20ns / 10ns

module TestBench;

	// Inputs
	reg Clock;
	reg Reset;


	reg PS2_DATA;
	reg PS2_CLK;
	// Outputs
	wire [7:0] oLed;
	wire [11:8] SF_D;

	wire LCD_E;
	wire LCD_RS;
	wire LCD_RW;
	wire No_se;
	wire VGA_RED;
	wire VGA_GREEN;
	wire VGA_BLUE;
	wire VGA_VS;
	wire VGA_HS;

	// Instantiate the Unit Under Test (UUT)
	MiniAlu uut (
		.Clock(Clock),
		.Reset(Reset),
		.oLed(oLed),
		.SF_D(SF_D),
		.LCD_E(LCD_E),
		.LCD_RS(LCD_RS),
		.LCD_RW(LCD_RW),
		.No_se(No_se),
		.VGA_RED(VGA_RED),
		.VGA_GREEN(VGA_GREEN),
		.VGA_BLUE(VGA_BLUE),
		.VGA_VS(VGA_VS),
		.VGA_HS(VGA_HS),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK)
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
