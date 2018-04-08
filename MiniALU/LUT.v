`timescale 1ns / 1ps

module LUT #(parameter i=0) (a, b, c);	
	input wire[15:0]  a, b;
	output [15:0] c;
	reg [15:0]temporal;
	always@(*)begin
        	case(b[i+1:i])
			2'b00: temporal=0;
			2'b01: temporal=a;	
			2'b10: temporal=a<<1;
			2'b11: temporal=(a<<1)+a;
			endcase
		end
		assign c=temporal<<i;
endmodule
