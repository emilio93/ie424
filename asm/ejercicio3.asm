NOP,24'd4000 
STO, R0, 16'b0 // cero 
STO, R1, 16'b1 // uno 
STO, R8, 16'b11111111 // maximo 
 
INICIO: 
STO, R2, 16'b1 // valor en leds 
 
STO, R3, 16'd5 // multiplicador 
STO, R4, 16'd10 // cuentas para el ciclo2 
STO, R5, 16'd25 // cuentas para el ciclo3 
 
LOOP1: 
STO, R6, 16'd0 // i 
LOOP2: 
  STO, R7, 16'd0 // j 
  LED, 8'b0, R2, 8'b0 
  LOOP3: 
    ADD, R7, R7, R1 
    BLE, LOOP3, R7, R5 
  ADD, R6, R6, R1 
  BLE, LOOP2, R6, R4 
MUL16BITS, R2, R2, R3
NOP,24'd0
BLE, LOOP1, R2, R8
JMP, INICIO, 16'd0
