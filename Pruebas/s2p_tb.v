`include "../serial2parallel.v"

module testbench;
  reg wClock, wReset, w1b;
  wire [9:0] w10b;

  serial2parallel s2p(.Clock(wClock), .iReset(wReset), .i1b(w1b), .o11b(w10b));

  always begin
    #5 wClock = ~wClock;
  end

  initial begin
    wClock <= 1;
    wReset <= 0;
    w1b <= 1;

    #10 wReset <= 1;
    #20 wReset <= 0;

    #20 w1b <= 1;
    #10 w1b <= 0;//inicia
    #10 w1b <= 1;
    #10 w1b <= 1;
    #10 w1b <= 0;
    #10 w1b <= 1;
    #10 w1b <= 0;
    #10 w1b <= 0;
    #10 w1b <= 0;
    #10 w1b <= 1;
    #10 w1b <= 1;
    #10 w1b <= 1; //termina 011010001 11 --> 3

    #40 w1b <= 1;
    #10 w1b <= 0;//inicia
    #10 w1b <= 1;
    #10 w1b <= 1;
    #10 w1b <= 1;
    #10 w1b <= 1;
    #10 w1b <= 0;
    #10 w1b <= 0;
    #10 w1b <= 0;
    #10 w1b <= 0;
    #10 w1b <= 1;
    #10 w1b <= 1; //termina 011110000 11 --> 3

    #40 w1b <= 1;
    #10 w1b <= 0;//inicia
    #10 w1b <= 1;
    #10 w1b <= 0;
    #10 w1b <= 0;
    #10 w1b <= 0;
    #10 w1b <= 0;
    #10 w1b <= 1;
    #10 w1b <= 1;
    #10 w1b <= 0;
    #10 w1b <= 1;
    #10 w1b <= 1; //termina 010000110 11 --> 2
    #60
    $finish;
  end

  initial begin
    $dumpfile("waves.vcd");
    $dumpvars(0, testbench);
  end
endmodule //testbench
