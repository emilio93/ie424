`timescale 20ns / 10ns

module TestBench_VGAAdapter;

  reg        Clock;
  reg        Reset;
  reg[9:0] wP, hP;
  wire[3:0] wM, hM;

	// Instantiate the Unit Under Test (UUT)
  VGAAdapter  # (
    640,
    480,
    32,
    24,
    20, // 640 / 32
    20 // 480 / 24
  ) VGAAdapter (
    .widthVgaPos(wP),
    .heightVgaPos(hP),
    .widthMemPos(wM),
    .heightMemPos(hM)
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
    @ (posedge Clock);
		Reset <= 1;

		wP <= 0;
		hP <= 0;

    #50
    @ (posedge Clock);
		Reset <= 0;

		// Wait 100 ns for global reset to finish
	#100;
 @ (posedge Clock);
	Reset <= 1;

	wP <= 100;
	hP <= 50;

	 #100

	wP <= 200;
	hP <= 100;

	 #100

	wP <= 400;
	hP <= 200;
	 #100

	wP <= 639;
	hP <= 479;

	end

endmodule
