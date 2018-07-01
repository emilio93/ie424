module decoder (i11b, iNum, error, oKey);
  input [2:0] iNum;
  input [10:0] i11b;
  output reg [7:0] oKey;
  output reg error;

  always @ (*) begin
    if ((i11b[0] != 1) || (i11b[10] != 0) || (iNum[0] != i11b[1])) begin
      error = 1;
    end else begin
      error = 0;
    end
    oKey[7:4] = i11b[5:2];
    oKey[3:0] = i11b[9:6];
  end
endmodule //decoder
