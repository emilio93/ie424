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
`define STATE_STALL 14

module LCD(
  input wire Clock,
  input wire Reset,
  output wire oLCD_Enabled,
  output reg oLCD_RegisterSelect, //Command = 0, Data = 1
  output wire oLCD_StrataFlashControl,
  output wire oLCD_ReadWrite,
  output reg [3:0] oLCD_Data
  );

  reg rWrite_Enabled;
  assign oLCD_ReadWrite = 0; //Solo escribo a la LCD, no leo de ella
  assign oLCD_StrataFlashControl = 1; //Full r/w access to LCD.

  reg [7:0] rCurrentState, rNextState;
  reg [31:0] rTimeCount;
  reg rTimeCountReset;

  reg [2:0] rWaitCount;

  assign oLCD_Enabled = rWrite_Enabled;

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
    end
  end

  //Current State and output logic
  always @ ( * ) begin
    case (rCurrentState)
    //--------------------------------------------------------
      `STATE_RESET: begin
        rWaitCount = 0;
        rWrite_Enabled = 0;
        oLCD_Data = 4'h0;
        oLCD_RegisterSelect = 1'b0;
        rTimeCountReset = 1'b0;
        rNextState = `STATE_START;
      end

    //--------------------------------------------------------
      //Esperar 750000 ciclos
      `STATE_START: begin
        rWrite_Enabled = 0;
        oLCD_Data = 4'h0;
        oLCD_RegisterSelect = 1'b0; //estoy enviando comandos
		
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
        rWrite_Enabled = 1;
        oLCD_RegisterSelect = 1'b0; //estoy enviando comandos

        if(rWaitCount == 3)begin
          oLCD_Data = 4'h2;
        end else begin
          oLCD_Data = 4'h3;
        end

        if (rTimeCount > 32'd12) begin
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
        rWrite_Enabled = 0;
        oLCD_Data = 4'h0;
        oLCD_RegisterSelect = 1'b0; //estoy enviando comandos

        if (rTimeCount > 32'd205000) begin
          rWaitCount = 2'd1;
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
        rWrite_Enabled = 0;
        oLCD_Data = 4'h0;
        oLCD_RegisterSelect = 1'b0; //estoy enviando comandos

        if (rTimeCount > 32'd5000) begin
          rWaitCount = 2'd2;
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
        rWrite_Enabled = 0;
        oLCD_Data = 4'h0;
        oLCD_RegisterSelect = 1'b0; //estoy enviando comandos

        if (rTimeCount > 32'd2000) begin
          rWaitCount = 2'd3;
          rNextState = `STATE_POWERON_CLEARD_A;
          rTimeCountReset = 1'b1;
        end else begin
          rNextState = rCurrentState;
          rTimeCountReset = 1'b0;
          end
        end

    //Function Set State

	`STATE_POWERON_CLEARD_A:
	begin
		rWrite_Enabled = 1'b0;
		oLCD_RegisterSelect = 1'b0; //these are commands
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
		rWrite_Enabled = 1'b0;
		oLCD_RegisterSelect = 1'b0; //these are commands
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

	`STATE_POWERON_EMS_A:
	begin
		rWrite_Enabled = 1'b0;
		oLCD_RegisterSelect = 1'b0; //these are commands
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
		rWrite_Enabled = 1'b0;
		oLCD_RegisterSelect = 1'b0; //these are commands
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
		rWrite_Enabled = 1'b0;
		oLCD_RegisterSelect = 1'b0; //these are commands
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
		rWrite_Enabled = 1'b0;
		oLCD_RegisterSelect = 1'b0; //these are commands
		rTimeCountReset = 1'b0;
		oLCD_Data = 4'hC;
		if (rTimeCount > 32'd2000 ) begin
		 rNextState = `STATE_POWERON_CLEAR_A;
		 rTimeCountReset = 1'b1;
		 end
		else
		 rNextState = `STATE_POWERON_DIS_ON_OFF_B;
		end
		
	//Display ON/OFF state
	`STATE_POWERON_CLEAR_A:
	begin
		rWrite_Enabled = 1'b0;
		oLCD_RegisterSelect = 1'b0; //these are commands
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
		rWrite_Enabled = 1'b0;
		oLCD_RegisterSelect = 1'b0; //these are commands
		rTimeCountReset = 1'b0;
		oLCD_Data = 4'hC;
		if (rTimeCount > 32'd82000 ) begin
		 rNextState = `STATE_POWERON_CLEAR_B;
		 rTimeCountReset = 1'b1;
		 end
		else
		 rNextState = `STATE_STALL;
		end	
	
	`STATE_STALL:
	begin
		 rNextState = `STATE_STALL;
		end

      default: ; //modo de espera de caracteres.
    endcase
  end
endmodule // LCD
