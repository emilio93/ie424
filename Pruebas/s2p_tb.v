`timescale 20ns / 10ns

module testbench;

  reg wClockFPGA, wReset, w1b;
  reg wClockTeclado;
  wire [7:0] w8b;
  reg tecla;

  serial2parallel s2p(
    .iReset(wReset),
    .ClockTeclado(wClockTeclado),
    .i1b(w1b),
    .o8b(w8b)
  );


  always #5 wClockFPGA = ~wClockFPGA;
  always #20000 wClockTeclado = ~(wClockTeclado & tecla);

  initial begin
    tecla <= 0;
    wClockFPGA <= 1;
    wReset <= 0;
    w1b <= 1;
    wClockTeclado <= 1;
    #10 wReset <= 1;
    #20 wReset <= 0;

    #159990 w1b <= 0;//inicia
    #10 wClockTeclado <= 0; tecla <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 0;
    #40000 w1b <= 1;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 1; //termina 011010001 11 --> 3
    tecla <= 0;

    #159990 w1b <= 0;//inicia
    #10 wClockTeclado <= 0; tecla <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 1;
    #40000 w1b <= 1; //termina 011110000 11 --> 3
    tecla<=0;

    #159990 w1b <= 0;//inicia
    #10 wClockTeclado <= 0; tecla <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 0;
    #40000 w1b <= 1;
    #40000 w1b <= 1;
    #40000 w1b <= 0;
    #40000 w1b <= 1;
    #40000 w1b <= 1; //termina 010000110 11 --> 2 (error de paridad forzado)
    tecla<=0;
    #2200000;
    $finish;
  end



  initial begin
    $dumpfile("waves.vcd");
    $dumpvars(0, testbench);
  end
endmodule //testbench
