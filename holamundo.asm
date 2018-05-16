NOP,24'd4000
STO, R0, 16'b0 // cero
STO, R1, 16'b1 // uno

STO, R13, 16'b0 // contador 1

STO, R14, 14'D1000 // cuenta 1
STO, R15, 15'D1000 // cuenta 2

INICIO:
STO, R2, H // H

// Esperar que LCD esté lista
LOOP1:
  STO, R12, 16'b0 // contador 2
  LOOP2:
    ADD, R12, R12, R1
    BLE, LOOP2, R15, R12
  ADD, R13, R13, R1
  BLE, LOOP1, R14, R13

// Escribir en LCD
LCD, 8'b0, R2, 8'b0

LOOPINFINITO:
NOP,24'd0
BLE, LOOPINFINITO, R1, R0
NOP,24'd0
JMP, INICIO, 16'd0
