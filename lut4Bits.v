`timescale 1ns / 1ps

module LUT4Bits # (parameter i=0, parameter DATA_WIDTH=16, parameter LUT_BITS=4)(
  input wire [DATA_WIDTH-1:0] a,
  input wire [DATA_WIDTH-1:0] b,
  output wire [DATA_WIDTH-1:0] c
);

reg [DATA_WIDTH-1:0] result;

always @ ( * )
begin
case (b[i+(LUT_BITS-1):i])
	4'b0000 : result=0;
	4'b0001 : result=a;
	4'b0010 : result=a<<1;
	4'b0011 : result=(a<<1)+a;

	4'b0100 : result=a<<2;
	4'b0101 : result=(a<<2)+a;
	4'b0110 : result=(a<<2)+(a<<1);
	4'b0111 : result=(a<<2)+(a<<1)+a;

	4'b1000 : result=a<<3;
	4'b1001 : result=(a<<3)+a;
	4'b1010 : result=(a<<3)+(a<<1);
	4'b1011 : result=(a<<3)+(a<<1)+a;
	
	4'b1100 : result=(a<<3)+(a<<2);
	4'b1101 : result=(a<<3)+(a<<2)+a;
	4'b1110 : result=(a<<3)+(a<<2)+(a<<1);
	4'b1111 : result=(a<<3)+(a<<2)+(a<<1)+a;
	default: result=0;
endcase
end
assign c = result<<i;
endmodule
