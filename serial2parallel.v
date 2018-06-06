module serial2parallel (iReset, ClockFPGA, ClockTeclado, i1b, o11b, oNum);
  input ClockFPGA, ClockTeclado, i1b, iReset;
  output reg [10:0] o11b;
  output reg [2:0] oNum;

  reg recieving;
  reg [10:0] buffer_11b;
  reg [3:0] cont;
  reg [2:0] cuenta;
  reg ClockSampled;

  always @ (posedge ClockFPGA) begin
    if (iReset) begin
      recieving <= 0;
      buffer_11b <= 11'bz;
      cont <= 0;
      oNum <= 0;
      cuenta <= 0;
      ClockSampled <= 1;
    end else begin
      ClockSampled <= ClockTeclado;
    end
  end

  always @(negedge ClockSampled) begin
    buffer_11b[10-cont] <= i1b;
    cont <= cont + 1;

    if (0 < cont && cont < 9) begin
      if (i1b == 1) begin
        cuenta <= cuenta + 1;
      end
    end
  end

  always @ (posedge ClockSampled) begin
    if (cont == 11) begin
      o11b <= buffer_11b;
      oNum <= cuenta;
      buffer_11b <= 11'bz;
      cont <= 0;
      cuenta <= 0;
      recieving <= 0;
    end
  end
endmodule //serial2parallel
