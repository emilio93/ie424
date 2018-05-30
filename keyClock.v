module keyClock (iClock, enable, oClock);
  input iClock, enable;
  output reg oClock;

  reg [11:0] cont;

  always @ (posedge enable) begin
    oClock <= 0;
  end

  always @ (posedge iClock) begin
    if (enable == 1) begin
      if (cont > 4000) begin
        oClock <= ~oClock;
        cont <= 0;
      end else begin
        cont <= cont + 1;
      end
    end else begin
      cont <= 0;
      oClock <= 1;
    end
  end
endmodule //key_clock
