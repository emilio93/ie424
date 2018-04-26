`timescale 1ns / 1ps

module MulLUT #(parameter DATA_WIDTH=16, parameter LUT_BITS=2)(B, A, C);	
input [DATA_WIDTH-1:0] A,B;
output [DATA_WIDTH-1:0] C;
wire [DATA_WIDTH-1:0] Ctemp [(DATA_WIDTH/LUT_BITS)-1:0];
wire [DATA_WIDTH-1:0] suma [(DATA_WIDTH/LUT_BITS)-2:0];

genvar i, n;
generate
  for (n=0; n<(DATA_WIDTH/LUT_BITS); n=n+1) begin : for_luts
    if (LUT_BITS==4) LUT4Bits #(.i(n*LUT_BITS)) lut(.a(A), .b(B), .c(Ctemp[n]));
	 else LUT #(.i(n*LUT_BITS)) lut(.a(A), .b(B), .c(Ctemp[n]));
  end
  assign suma[0] = Ctemp[0] + Ctemp[1];
  for(i=0; i<(DATA_WIDTH/LUT_BITS)-2; i=i+1) begin : for_suma
    assign suma[i+1] = suma[i] + Ctemp[i+2];
  end
endgenerate

assign C = suma[(DATA_WIDTH/LUT_BITS)-2];
endmodule
