module serial2parallel (iReset, Clock, i1b, o11b);
  input Clock, i1b, iReset;
  output reg [10:0] o11b;

  reg recieving;
  reg [10:0] buffer_11b;
  reg [3:0] cont;

  always @ (negedge i1b) begin
    recieving <= 1;
  end

  always @(negedge Clock) begin
    if (!iReset) begin
      if (recieving == 1) begin
        buffer_11b[10-cont] <= i1b;
        cont <= cont + 1;
        if (cont == 11) begin
          o11b <= buffer_11b;
          buffer_11b <= 0;
          cont <= 0;
          recieving <= 0;
        end
      end
    end else begin
      recieving <= 0;
      buffer_11b <= 0;
      cont <= 0;
    end
  end
endmodule //serial2parallel
