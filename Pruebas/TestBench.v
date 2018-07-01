`timescale 20ns / 10ns

module TestBench;

	// Inputs
	reg Clock;
	reg Reset;

	// Outputs
	wire [7:0] oLed;

	// Instantiate the Unit Under Test (UUT)
	MiniAlu uut (
		.Clock(Clock),
		.Reset(Reset),
		.oLed(oLed)
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

