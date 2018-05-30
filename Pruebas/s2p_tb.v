
`include "../serial2parallel.v"
`include "../decoder.v"

module testbench;
  reg wClock, wReset, w1b;
  wire wError;
  wire [10:0] w11b;
  wire [2:0] wNum;
  wire [7:0] wKey;

  serial2parallel s2p(.Clock50(wClock), .iReset(wReset), .i1b(w1b), .o11b(w11b), .oNum(wNum));
  decoder dec(.i11b(w11b), .iNum(wNum), .error(wError), .oKey(wKey));

  always begin
    #5 wClock = ~wClock;
  end

  initial begin
    wClock <= 1;
    wReset <= 0;
    w1b <= 1;

    #10 wReset <= 1;
    #20 wReset <= 0;

    #160000;
    #160000 w1b <= 0;//inicia
    #80000 w1b <= 1;
    #80000 w1b <= 1;
    #80000 w1b <= 0;
    #80000 w1b <= 1;
    #80000 w1b <= 0;
    #80000 w1b <= 0;
    #80000 w1b <= 0;
    #80000 w1b <= 1;
    #80000 w1b <= 1;
    #80000 w1b <= 1; //termina 011010001 11 --> 3

    #160000;
    #80000 w1b <= 0;//inicia
    #80000 w1b <= 1;
    #80000 w1b <= 1;
    #80000 w1b <= 1;
    #80000 w1b <= 1;
    #80000 w1b <= 0;
    #80000 w1b <= 0;
    #80000 w1b <= 0;
    #80000 w1b <= 0;
    #80000 w1b <= 1;
    #80000 w1b <= 1; //termina 011110000 11 --> 3

    #160000;
    #80000 w1b <= 0;//inicia
    #80000 w1b <= 1;
    #80000 w1b <= 0;
    #80000 w1b <= 0;
    #80000 w1b <= 0;
    #80000 w1b <= 0;
    #80000 w1b <= 1;
    #80000 w1b <= 1;
    #80000 w1b <= 0;
    #80000 w1b <= 1;
    #80000 w1b <= 1; //termina 010000110 11 --> 2 (error de paridad forzado)
    #220000
    $finish;
  end

  initial begin
    $dumpfile("waves.vcd");
    $dumpvars(0, testbench);
  end
endmodule //testbench
