NOP,24'd4000
STO, R0, 16'b0 // cero
STO, R1, 16'b1 // uno
STO, R8, 16'b11111111 // maximo

INICIO:
STO, R2, 16'b1 // valor en leds

STO, R3, 16'd2 // multiplicador
STO, R4, 16'd65000 // cuentas para el ciclo2
STO, R5, 16'd65000 // cuentas para el ciclo3
PUSH, 16'b0, R3
PUSH, 16'b0, R4
PUSH, 16'b0, R5

STO, R7, 16'd6623 // valor en r7 se mantiene a traves de la subrutina

LOOP1:
STO, R6, 16'd0 // i
MUL, R2, R2, R3
LOOP2:
  LED, 8'b0, R6, 8'b0
  PUSH, 16'b0, R7
  CALL, SUBRUTINA, 16'b0
  POP, R7, 16'b0
  ADD, R6, R6, R1
  BLE, LOOP2, R6, R4
MUL, R2, R2, R3
NOP,24'd0
BLE, LOOP1, R2, R8
JMP, INICIO, 16'd0

SUBRUTINA:
  NOP,24'd0
  STO, R7, 16'd0 // j
  NOP,24'd0
  LOOP3:
    ADD, R7, R7, R1
    BLE, LOOP3, R7, R5
  NOP,24'd0
  RET, 16'b0, RA
