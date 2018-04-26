`timescale 1ns / 1ps

/**
 El módulo RAM_DUAL_READ_PORT se encarga de leer dos datos y escribir un dato en una memoria
 si se indica mediante la señal iWriteEnable.

 Parámetros:
   - DATA_WIDTH:
	 - ADDR_WIDTH:
	 - MEM_SIZE:
Wire's:

   - Clock: señal de reloj del módulo.
	 - iWriteEnable: Indica si se habilita la escritura de datos en el módulo.
	 - iReadAddress0: Dirección de lectura 0.
	 - iReadAddress1: Dirección de lectura 1.
	 - iWriteAddress: Dirección de escritura.
	 - iDataIn: Dato que se ecribe.
	 - oDataOut0: Dato 0 que se lee.
   - oDataOut1: Dato 1 que se escribe.
 */
module RAM_DUAL_READ_PORT # ( parameter DATA_WIDTH= 16, parameter ADDR_WIDTH=8, parameter MEM_SIZE=16 )
(
	input wire						Clock,
	input wire						iWriteEnable,
	input wire[ADDR_WIDTH-1:0]	iReadAddress0,
	input wire[ADDR_WIDTH-1:0]	iReadAddress1,
	input wire[ADDR_WIDTH-1:0]	iWriteAddress,
	input wire[DATA_WIDTH-1:0]		 	iDataIn,
	output reg [DATA_WIDTH-1:0] 		oDataOut0,
	output reg [DATA_WIDTH-1:0] 		oDataOut1
);

reg [DATA_WIDTH-1:0] Ram [MEM_SIZE:0];		

always @(posedge Clock) 
begin 
	
		if (iWriteEnable) 
			Ram[iWriteAddress] <= iDataIn; 
			
	
			oDataOut0 <= Ram[iReadAddress0]; 
			oDataOut1 <= Ram[iReadAddress1]; 
		
end 
endmodule

