

module testbench;
  reg rst , w1b;
  reg wClockTeclado;
  wire wError;
  wire [10:0] w11b;
  wire [2:0] wNum;
  wire [7:0] wKey;
  reg tecla;
  reg clk;

	// Inputs
	wire [3:0] SF_D;
	wire LCD_E;
	wire LCD_RS;
	wire LCD_RW;
	wire No_se;

	// Outputs
	wire  VGA_RED, VGA_GREEN, VGA_BLUE;
	wire [18:0] ctrH, ctrV;
	wire VGA_VS;
	wire VGA_HS;
	
	wire [2:0] dataOut;
	
		// Instantiate the Unit Under Test (UUT)
	MiniAlu uut (
		.Clock(clk),
		.Reset(rst),
		.SF_D(SF_D),
		.LCD_E(LCD_E),
		.LCD_RS(LCD_RS),
		.LCD_RW(LCD_RW),
		.No_se(No_se),
		.VGA_RED(VGA_RED),
		.VGA_BLUE(VGA_BLUE),
		.VGA_GREEN(VGA_GREEN),
		.VGA_VS(VGA_VS),
		.VGA_HS(VGA_HS),
		.PS2_CLK(wClockTeclado),
		.PS2_DATA(w1b)
	);

	always #5 clk  = ~clk ;
   always #20000 wClockTeclado = ~(wClockTeclado & tecla);
	
	initial begin
	 // Initialize Inputs
	 clk = 0;
	 rst = 0;
	 // Wait 100 ns for global rst  to finish
	 #100;
	 rst = 1;
	 #50
	 rst = 0;
    tecla <= 0;
    rst  <= 0;
    w1b <= 1;
    wClockTeclado <= 1;
    #10 rst  <= 1;
    #20 rst  <= 0;

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
  end

endmodule //testbench
