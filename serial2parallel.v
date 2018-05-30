`include "../keyClock.v"

module serial2parallel (iReset, Clock50, i1b, o11b, oNum);
  input Clock50, i1b, iReset;
  output reg [10:0] o11b;
  output reg [2:0] oNum;

  reg recieving;
  reg [10:0] buffer_11b;
  reg [3:0] cont;
  reg [2:0] cuenta;
  wire Clock25;

  keyClock kc(.iClock(Clock50), .enable(recieving), .oClock(Clock25));

  always @ (negedge i1b) begin
    recieving <= 1;
  end

  always @ (negedge Clock50) begin
    if (iReset) begin
      recieving <= 0;
      buffer_11b <= 11'bz;
      cont <= 0;
      oNum <= 0;
      cuenta <= 0;
    end
  end

  always @(negedge Clock25) begin
    if (recieving == 1) begin
      buffer_11b[10-cont] <= i1b;
      cont <= cont + 1;

      if (0 < cont && cont < 9) begin
        if (i1b == 1) begin
          cuenta <= cuenta + 1;
        end
      end

      if (cont == 11) begin
        o11b <= buffer_11b;
        oNum <= cuenta;
        buffer_11b <= 11'bz;
        cont <= 0;
        cuenta <= 0;
        recieving <= 0;
      end
    end
  end
endmodule //serial2parallel
