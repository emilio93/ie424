`timescale 1ns / 1ps
`include "Defintions.v"

`define LOOP1 8'd8
`define LOOP2 8'd5
module ROM
(
	input  wire[15:0]  		iAddress,
	output reg [27:0] 		oInstruction
);
always @ ( iAddress )
begin
	case (iAddress)

	0: oInstruction = { `NOP ,24'd4000    };
	1: oInstruction = { `STO , `R7,16'b0001 }; //R7 = 1
	2: oInstruction = { `STO ,`R3,16'h1     }; //R3 = 1
	3: oInstruction = { `STO, `R4,16'd1000 }; //R4 = 8
	4: oInstruction = { `STO, `R5,16'd0     };  //j = 0
	5: oInstruction = { `STO, `R6,-16'd2     };  //R6 = -2
//LOOP2:
	6: oInstruction = { `LED ,8'b0,`R7,8'b0 }; // pone R7 en los LEDs
	7: oInstruction = { `STO ,`R1,16'h0     }; 	// i = 0
	8: oInstruction = { `STO ,`R2,16'd420 }; // limite del for
//LOOP1:
	9: oInstruction = { `ADD ,`R1,`R1,`R3    }; // i++
	10: oInstruction = { `BLE ,`LOOP1,`R1,`R2 }; // if (i <= 420) pasa a Loop 1: condicion del for

	11: oInstruction = { `ADD ,`R5,`R5,`R3    };// j++
	12: oInstruction = { `BLE ,`LOOP2,`R5,`R4 };// if (j <= 8) pasa a Loop 2: condicion del for
	13: oInstruction = { `NOP ,24'd4000       };
	14: oInstruction = { `MULT ,`R7,`R7,`R6    };// acumulador = acumulador * 2
	15: oInstruction = { `JMP ,  8'd2,16'b0   };// salta a la instruccion 2
	default:
		oInstruction = { `LED ,  24'b10101010 };		//NOP
	endcase
end

endmodule
