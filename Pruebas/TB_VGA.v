`timescale 20ns / 10ns
`include "../VGA.v"
module TB_VGA;

  reg clk;
  reg rst;
  reg [2:0] rgb;
  
  wire [9:0] oCtrH, oCtrV;
  wire RED, GREEN, BLUE, HS, VS;
  
  VGA VGA (
  .clk(clk),
  .rst(rst),
  .rgb(rgb),
  .oCtrH(oCtrH), 
  .oCtrV(oCtrV),
  .RED(RED), 
  .GREEN(GREEN), 
  .BLUE(BLUE), 
  .HS(HS), 
  .VS(VS)
  );
	
	always
	begin
		#1  clk =  ! clk;
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		rgb = 3'b100;
		#100
		rst=1;
	
	end

endmodule
