`timescale 1ns / 1ps

module Stack # ( parameter DATA_WIDTH= 16, parameter ADDR_WIDTH=8, parameter MEM_SIZE=64 )
(
	input wire						            Clock,
	input wire						            Reset,
  input wire                        write,
  input wire                        read,
  input wire                        setSP,
  input wire [$clog2(MEM_SIZE)-1:0] stackPointerIn,
	input wire[DATA_WIDTH-1:0]        iDataIn,
	output reg [DATA_WIDTH-1:0]       oDataOut,
  output reg [$clog2(MEM_SIZE)-1:0] stackPointer
);

  // states
  parameter [2:0] STATE_RESET       = 3'd0,
                  STATE_ERROR_READ  = 3'd1,
                  STATE_WRITE       = 3'd2,
                  STATE_IDLE        = 3'd3,
                  STATE_READ        = 3'd4,
                  STATE_ERROR_WRITE = 3'd5,
                  STATE_SET_SP      = 3'd6;

  // state machine
  reg[6:0] state;
  reg[6:0] next;

  // memoria
  reg [DATA_WIDTH-1:0] stack [MEM_SIZE-1:0]; 

  always @(posedge Clock or posedge Reset) begin
    if (Reset) begin
      state <= 5'b0;
      stackPointer <= 0;
      state[STATE_RESET] <= 1'b1;

    end else begin
      state <= next;
      if (state[STATE_ERROR_READ]) begin
        
      end else if (state[STATE_WRITE]) begin
        stack[stackPointer] <= iDataIn;
        if (stackPointer < MEM_SIZE-1) stackPointer <= stackPointer + 1;
        
      end else if (state[STATE_IDLE]) begin
      
      end else if (state[STATE_READ]) begin
        oDataOut <= stack[stackPointer];
        if (stackPointer > 0) stackPointer <= stackPointer - 1;
        
      end else if (state[STATE_ERROR_WRITE]) begin
      
      end else if (state[STATE_SET_SP]) begin
        stackPointer <= stackPointerIn;
      end
    end
  end


  // LOGICA DEL SIGUIENTE ESTADO
  always @(*) begin
    next = 5'b0;
    drive_defaults;
    case (1'b1)
      state[STATE_RESET]: begin
        next[STATE_ERROR_READ] = 1'b1;
      end
      state[STATE_ERROR_READ]: begin
        if (write) begin
          next[STATE_WRITE] = 1'b1;
        end else if (setSP) begin 
          next[STATE_SET_SP] = 1'b1;
        end else begin
          next[STATE_ERROR_READ] = 1'b1;
        end
      end
      state[STATE_ERROR_WRITE]: begin
        if (read) begin
          next[STATE_READ] = 1'b1;
        end else if (setSP) begin 
          next[STATE_SET_SP] = 1'b1;
        end else begin
          next[STATE_ERROR_WRITE] = 1'b1;
        end
      end
      state[STATE_WRITE]: begin
        if (stackPointer == MEM_SIZE-1) begin
          next[STATE_ERROR_WRITE] = 1'b1;
        end else if (setSP) begin 
          next[STATE_SET_SP] = 1'b1;
        end else if (write) begin
          next[STATE_WRITE] = 1'b1;
        end else if (read)begin
          next[STATE_READ] = 1'b1;
        end else begin
          next[STATE_IDLE] = 1'b1;
        end
      end
      state[STATE_READ]: begin
        if (stackPointer == 0) begin
          next[STATE_ERROR_READ] = 1'b1;
        end else if (write) begin
          next[STATE_WRITE] = 1'b1;
        end else if (read)begin
          next[STATE_READ] = 1'b1;
        end else begin
          next[STATE_IDLE] = 1'b1;
        end
      end
      state[STATE_IDLE]: begin
        if (setSP) begin
          next[STATE_SET_SP] = 1'b1;
        end else if (write) begin
          next[STATE_WRITE] = 1'b1;
        end else if (read)begin
          next[STATE_READ] = 1'b1;
        end else begin
          next[STATE_IDLE] = 1'b1;
        end
      end
      state[STATE_SET_SP]: begin
        if (setSP) begin
          next[STATE_SET_SP] = 1'b1;
        end else if (write) begin
          next[STATE_WRITE] = 1'b1;
        end else if (read)begin
          next[STATE_READ] = 1'b1;
        end else begin
          next[STATE_IDLE] = 1'b1;
        end
      end
    endcase
  end

  task drive_defaults;
    begin
    end
  endtask
endmodule