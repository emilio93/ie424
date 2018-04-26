`timescale 1ns / 1ps

// Multiplica 2 numeros de DATA_WIDTH bits, por defecto 16
module Mul16Bit # (parameter DATA_WIDTH=16)(
  input wire [DATA_WIDTH-1:0] a,
  input wire [DATA_WIDTH-1:0] b,
  output wire [DATA_WIDTH-1:0] result
);

wire [DATA_WIDTH-1:0] partialResult [DATA_WIDTH-2:0];
wire [DATA_WIDTH-1:0] carry [DATA_WIDTH-2:0];

genvar i, j; // col, row
genvar m;
generate
  for (j=0; j<DATA_WIDTH-1; j=j+1) begin : for_row
    for (i=0; i<DATA_WIDTH; i=i+1) begin : for_col
	   Adder adder(
        .A(a[j+1]&b[i]),
        .B((j==0) ? (i==DATA_WIDTH-1)? 0 : a[0] & b[i+1] : (i==DATA_WIDTH-1) ? carry[j-1][i] : partialResult[j-1][i+1]),
        .Ci((i==0) ? 0 : carry[j][i-1]),
        .R(partialResult[j][i]),
        .Co(carry[j][i])
	   );
    end
  end
  for (m=0; m<DATA_WIDTH; m=m+1) begin : for_result
    if (m==0) begin
      assign result[m] = a[0] & b[0];
    end else begin
	   assign result[m] = partialResult[m-1][0];
	 end
  end
endgenerate
endmodule
