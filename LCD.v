//`timescale 1ns/1ns

`define STATE_RESET 0 //poner todo en cero
`define STATE_START 1 //esperar tiempo inicial (750000)
`define STATE_POWER_INIT 2 //senales de inicializacion de la pantalla
`define STATE_POWER_WAIT0 3 //esperar 205000 ciclos
`define STATE_POWER_WAIT1 4 //esperar 5000 ciclos
`define STATE_POWER_WAIT2 5 //esperar 2000 ciclos
`define STATE_POWERON_CLEARD_A 6
`define STATE_POWERON_CLEARD_B 7
`define STATE_POWERON_EMS_A 8
`define STATE_POWERON_EMS_B 9
`define STATE_POWERON_DIS_ON_OFF_A 10
`define STATE_POWERON_DIS_ON_OFF_B 11
`define STATE_POWERON_CLEAR_A 12
`define STATE_POWERON_CLEAR_B 13
`define STATE_IDLE 14

`define STATE_WRITE_MSN 15
`define STATE_WRITE_DELAY 16
`define STATE_WRITE_LSN 17
`define STATE_WRITE_WAIT 18

module LCD(
  input wire Clock, //reloj
  input wire Reset, //reiniciar
  input wire write_Enabled, //senal que indica que se quiere escribir
  input wire [7:0] iData, //informacion de entrada

  output reg oLCD_Enabled, //habilitador de la pantalla
  output reg oLCD_RS, //command = 0. Data = 1
  output reg oLCD_RW, //para escribir es 0
  output wire oLCD_StrataFlashControl, //para lo de intel
  output reg [3:0] oLCD_Data, //salida de datos hacia la panatalla
  output reg oIsInitialized,
  output reg ready
  );

  reg [7:0] rCurrentState, rNextState;
  reg [31:0] rTimeCount;
  reg rTimeCountReset;
  reg [2:0] wWaitCount;
  reg [2:0] rWaitCount;
  reg [7:0] wBuffer;
  reg [7:0] rBuffer;

  assign oLCD_StrataFlashControl = 1; //Full r/w access to LCD

  //Next State and Delay Logic
  always @ ( posedge Clock ) begin
    if (Reset) begin
      rCurrentState <= `STATE_RESET;
      rTimeCount <= 32'b0;
    end
    else begin
      if (rTimeCountReset) begin
        rTimeCount <= 32'b0;
      end
      else begin
        rTimeCount <= rTimeCount + 32'b1;
      end
    rCurrentState <= rNextState;
	 rWaitCount <= wWaitCount;
	 rBuffer <= wBuffer;
    end
  end

  //Current State and output logic
  always @ ( * ) begin
    drive_defaults;

    case (rCurrentState)
    //--------------------------------------------------------
      `STATE_RESET: begin
        ready = 1'b0;
		  wBuffer = 8'b0;
        wWaitCount = 0;
        oLCD_Enabled = 0;
        oLCD_Data = 4'h0;
        oLCD_RS = 1'b0;
        oLCD_RW = 1'b0;
        rTimeCountReset = 1'b0;
        rNextState = `STATE_START;
      end

    //--------------------------------------------------------
      //Esperar 750000 ciclos
      `STATE_START: begin
        ready = 1'b0;
        oLCD_Enabled = 0;
        oLCD_Data = 4'h0;
        oLCD_RS = 1'b0; //estoy enviando comandos
        oLCD_RW = 1'b0;

      if (rTimeCount < 32'd750000) begin
          rNextState = rCurrentState;
          rTimeCountReset = 1'b0;
        end

        else begin
          rNextState = `STATE_POWER_INIT;
          rTimeCountReset = 1'b1;
        end
      end

    //-------------------------------------------------------
      //escritura de 0x3 o 0x2 segun corresponda; y esperar 12 ciclos
      `STATE_POWER_INIT: begin
        ready = 1'b0;
        oLCD_Enabled = 1;
		  wWaitCount = rWaitCount;
        oLCD_RS = 1'b0; //estoy enviando comandos
        oLCD_RW = 1'b0;

        if(rWaitCount == 3)begin
          oLCD_Data = 4'h2;
        end else begin
          oLCD_Data = 4'h3;
        end

        if (rTimeCount >= 32'd11) begin
          rTimeCountReset = 1'b1;
          case (rWaitCount)
            0:  rNextState = `STATE_POWER_WAIT0;
            1:  rNextState = `STATE_POWER_WAIT1;
            2:  rNextState = `STATE_POWER_WAIT2;
            3:  rNextState = `STATE_POWER_WAIT2;
          endcase
        end else begin
          rNextState = rCurrentState;
          rTimeCountReset = 1'b0;
        end
      end

    //---------------------------------------------------------
      //Esperar 205000 ciclos
      `STATE_POWER_WAIT0: begin
        ready = 1'b0;
        oLCD_Enabled = 0;
        oLCD_Data = 4'h0;
        oLCD_RS = 1'b0; //estoy enviando comandos
        oLCD_RW = 1'b0;

        if (rTimeCount > 32'd205000) begin
          wWaitCount = 2'd1;
          rNextState = `STATE_POWER_INIT;
          rTimeCountReset = 1'b1;
        end else begin
          rNextState = rCurrentState;
          rTimeCountReset = 1'b0;
        end
      end

    //---------------------------------------------------------
      //Esperar 5000 ciclos
      `STATE_POWER_WAIT1: begin
        ready = 1'b0;
        oLCD_Enabled = 0;
        oLCD_Data = 4'h0;
        oLCD_RS = 1'b0; //estoy enviando comandos
        oLCD_RW = 1'b0;

        if (rTimeCount > 32'd5000) begin
          wWaitCount = 2'd2;
          rNextState = `STATE_POWER_INIT;
          rTimeCountReset = 1'b1;
        end else begin
          rNextState = rCurrentState;
          rTimeCountReset = 1'b0;
        end
      end

    //---------------------------------------------------------
      //Esperar 2000 ciclos
      `STATE_POWER_WAIT2: begin
        ready = 1'b0;
		  wWaitCount = rWaitCount;
        oLCD_Enabled = 0;
        oLCD_Data = 4'h0;
        oLCD_RS = 1'b0; //estoy enviando comandos
        oLCD_RW = 1'b0;

        if (rTimeCount > 32'd2000) begin
			 if(rWaitCount == 2'd3) begin
				 rNextState = `STATE_POWERON_CLEARD_A;
				 rTimeCountReset = 1'b1;
				end
			 else if(rWaitCount == 2'd2) begin
				 wWaitCount = 2'd3;
				 rNextState = `STATE_POWER_INIT;
				 rTimeCountReset = 1'b1;
				end
        end else begin
          rNextState = rCurrentState;
          rTimeCountReset = 1'b0;
          end
        end

    //Function Set State
    //------------------------------------------------
      `STATE_POWERON_CLEARD_A:
      begin
        ready = 1'b0;
        if (2 <= rTimeCount & rTimeCount < 14) begin
			  oLCD_Enabled = 1'b1;
			  end
		  if (14 <= rTimeCount & rTimeCount < 15 ) begin
		     oLCD_Enabled = 1'b0;
			  end
        oLCD_RS = 1'b0; //these are commands
        rTimeCountReset = 1'b0;
        oLCD_Data = 4'h2;
        if (rTimeCount > 32'd50 ) begin
         rNextState = `STATE_POWERON_CLEARD_B;
         rTimeCountReset = 1'b1;
         end
        else
         rNextState = `STATE_POWERON_CLEARD_A;
        end
    //------------------------------------------
    `STATE_POWERON_CLEARD_B:
    begin
      ready = 1'b0;
      if (2 <= rTimeCount & rTimeCount < 14) begin
			  oLCD_Enabled = 1'b1;
			  end
	   if (14 <= rTimeCount & rTimeCount < 15 ) begin
			oLCD_Enabled = 1'b0;
			end
      oLCD_RS = 1'b0; //these are commands
      rTimeCountReset = 1'b0;
      oLCD_Data = 4'h8;
      if (rTimeCount > 32'd2000 )
       begin
       rNextState = `STATE_POWERON_EMS_A;
       rTimeCountReset = 1'b1;
       end
      else begin
       rNextState = `STATE_POWERON_CLEARD_B;
      end
    end

    //Entry mode state
  //---------------------------------------------------------
    `STATE_POWERON_EMS_A:
    begin
      ready = 1'b0;
      if (2 <= rTimeCount & rTimeCount < 14) begin
			  oLCD_Enabled = 1'b1;
			  end
	   if (14 <= rTimeCount & rTimeCount < 15 ) begin
			oLCD_Enabled = 1'b0;
			end
      oLCD_RS = 1'b0; //these are commands
      rTimeCountReset = 1'b0;
      oLCD_Data = 4'h0;
      if (rTimeCount > 32'd50 ) begin
       rNextState = `STATE_POWERON_EMS_B;
       rTimeCountReset = 1'b1;
      end
      else
       rNextState = `STATE_POWERON_EMS_A;
      end
      //------------------------------------------
    `STATE_POWERON_EMS_B:
    begin
      ready = 1'b0;
      if (2 <= rTimeCount & rTimeCount < 14) begin
			  oLCD_Enabled = 1'b1;
			  end
	   if (14 <= rTimeCount & rTimeCount < 15 ) begin
			oLCD_Enabled = 1'b0;
			end
      oLCD_RS = 1'b0; //these are commands
      rTimeCountReset = 1'b0;
      oLCD_Data = 4'h6;
      if (rTimeCount > 32'd2000 ) begin
       rNextState = `STATE_POWERON_DIS_ON_OFF_A;
       rTimeCountReset = 1'b1;
       end
      else
       rNextState = `STATE_POWERON_EMS_B;
      end


    //Display ON/OFF state
    `STATE_POWERON_DIS_ON_OFF_A:
    begin
      ready = 1'b0;
      if (2 <= rTimeCount & rTimeCount < 14) begin
			  oLCD_Enabled = 1'b1;
			  end
	   if (14 <= rTimeCount & rTimeCount < 15 ) begin
			oLCD_Enabled = 1'b0;
			end
      oLCD_RS = 1'b0; //these are commands
      rTimeCountReset = 1'b0;
      oLCD_Data = 4'h0;
      if (rTimeCount > 32'd50 ) begin
       rNextState = `STATE_POWERON_DIS_ON_OFF_B;
       rTimeCountReset = 1'b1;
       end
      else
       rNextState = `STATE_POWERON_DIS_ON_OFF_A;
      end
      //------------------------------------------
    `STATE_POWERON_DIS_ON_OFF_B:
    begin
      ready = 1'b0;
      if (2 <= rTimeCount & rTimeCount < 14) begin
			  oLCD_Enabled = 1'b1;
			  end
	   if (14 <= rTimeCount & rTimeCount < 15 ) begin
			oLCD_Enabled = 1'b0;
			end
      oLCD_RS = 1'b0; //these are commands
      rTimeCountReset = 1'b0;
      oLCD_Data = 4'hC;
      if (rTimeCount > 32'd2000 ) begin
       rNextState = `STATE_POWERON_CLEAR_A;
       rTimeCountReset = 1'b1;
       end
      else
       rNextState = `STATE_POWERON_DIS_ON_OFF_B;
      end

  //-------------------------------------------------------------
    //Display ON/OFF state
    `STATE_POWERON_CLEAR_A:
    begin
      ready = 1'b0;
      if (2 <= rTimeCount & rTimeCount < 14) begin
			  oLCD_Enabled = 1'b1;
			  end
	   if (14 <= rTimeCount & rTimeCount < 15 ) begin
			oLCD_Enabled = 1'b0;
			end
      oLCD_RS = 1'b0; //these are commands
      rTimeCountReset = 1'b0;
      oLCD_Data = 4'h0;
      if (rTimeCount > 32'd50 ) begin
       rNextState = `STATE_POWERON_CLEAR_B;
       rTimeCountReset = 1'b1;
       end
      else
       rNextState = `STATE_POWERON_CLEAR_A;
      end
      //------------------------------------------
    `STATE_POWERON_CLEAR_B:
    begin
      ready = 1'b0;
      if (2 <= rTimeCount & rTimeCount < 14) begin
			  oLCD_Enabled = 1'b1;
			  end
	   if (14 <= rTimeCount & rTimeCount < 15 ) begin
			oLCD_Enabled = 1'b0;
			end
	  /* if (rTimeCount < 15) begin 
			  oLCD_RW = 1'b0; 
			  end 
		else if (rTimeCount >= 15) begin 
			  oLCD_RW = 1'b1; 
           end*/
      oLCD_RS = 1'b0; //these are commands
      rTimeCountReset = 1'b0;
      oLCD_Data = 4'h1;
      if (rTimeCount < 32'd82000 ) begin
       rNextState = `STATE_POWERON_CLEAR_B;
       end
      else begin
       rNextState = `STATE_IDLE;
		 rTimeCountReset = 1'b1;
		 end
      end

    //Aqui empieza la escritura
    //---------------------------------------------
    `STATE_IDLE:
    begin
      oIsInitialized = 1'b1;
      ready = 1'b1;
      //oLCD_RW = 1'b1;
      oLCD_Enabled = 1'b0;
      oLCD_RS = 1'b0;
      oLCD_Data = 4'b0;

      if (write_Enabled == 1'b1) begin //write
        wBuffer = iData;
        rNextState = `STATE_WRITE_MSN;
        rTimeCountReset = 1'b1;
      end else begin
        rNextState = `STATE_IDLE;
        wBuffer = 8'b0;
      end
    end

    //---------------------------------------------
    `STATE_WRITE_MSN:
    begin
      oIsInitialized = 1'b1;
      ready = 1'b0;
      oLCD_RS = 1'b1;
      oLCD_RW = 1'b0;
      oLCD_Data = rBuffer[7:4];
      rTimeCountReset = 0;
		wBuffer = rBuffer;

      if (rTimeCount <= 32'd2) begin
        oLCD_Enabled = 1'b0;
        rNextState = rCurrentState;
      end
      if (2 <= rTimeCount & rTimeCount < 14) begin
        oLCD_Enabled = 1'b1;
        rNextState = rCurrentState;
      end
      if (14 <= rTimeCount & rTimeCount < 15 ) begin
        oLCD_Enabled = 1'b0;
        rNextState = rCurrentState;
      end
      if (rTimeCount >= 15) begin
        rNextState = `STATE_WRITE_DELAY;
      end
    end

    //---------------------------------------------------------
    //Esperar 50 ciclos = 1us
    `STATE_WRITE_DELAY: begin
      oIsInitialized = 1'b1;
		wBuffer = rBuffer;
      ready = 1'b0;
      oLCD_Enabled = 0;
      oLCD_Data = 4'h0;
      oLCD_RS = 1'b0; //estoy enviando comandos
      //oLCD_RW = 1'b1;

      if (rTimeCount > 32'd50) begin
        rNextState = `STATE_WRITE_LSN;
        rTimeCountReset = 1'b1;
      end else begin
        rNextState = rCurrentState;
        rTimeCountReset = 1'b0;
        end
      end

    //---------------------------------------------
    `STATE_WRITE_LSN:
      begin
        oIsInitialized = 1'b1;
        ready = 1'b0;
        rTimeCountReset = 1'b0;
        oLCD_RS = 1'b1;
        oLCD_RW = 1'b0;
        oLCD_Data = rBuffer[3:0];

        if (rTimeCount <= 32'd2) begin
          oLCD_Enabled = 1'b0;
          rNextState = rCurrentState;
        end
        if (2 <= rTimeCount & rTimeCount < 14) begin
          oLCD_Enabled = 1'b1;
          rNextState = rCurrentState;
        end
        if (14 <= rTimeCount & rTimeCount < 15 ) begin
          oLCD_Enabled = 1'b0;
          rNextState = rCurrentState;
        end
        if (rTimeCount >= 15) begin
          rNextState = `STATE_WRITE_WAIT;
        end
      end


    //---------------------------------------------------------
      //Esperar 2000 ciclos = 40us
      `STATE_WRITE_WAIT: begin
		  oIsInitialized = 1'b1;
        ready = 1'b0;
        oLCD_Enabled = 0;
        oLCD_Data = 4'h0;
        oLCD_RS = 1'b0; //estoy enviando comandos
        //oLCD_RW = 1'b1;
        rTimeCountReset = 1'b0;
        if (rTimeCount > 32'd2000) begin
          rNextState = `STATE_IDLE;
          rTimeCountReset = 1'b1;
        end
        else begin
          rNextState = rCurrentState;
          rTimeCountReset = 1'b0;
        end
      end
      default: 
		begin
			rNextState = `STATE_IDLE; //modo de espera de caracteres.
			end
	 endcase
  end

  task drive_defaults;
    begin
      oIsInitialized = 1'b0;
		wBuffer = 8'b0;
		wWaitCount = 0;
		rTimeCountReset = 1'b0;
		rNextState = 1'b0;
		oLCD_RS = 0;
		oLCD_Data = 4'b0;
		oLCD_Enabled = 0;
		ready = 0;
    end
  endtask
endmodule // LCD
