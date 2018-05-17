NOP,24'd4000
STO, R0, 16'b0 // cero
STO, R1, 16'b1 // uno

STO, R14, 16'd100 // cuenta 1
STO, R15, 16'd100 // cuenta 2

STO, R10, H // H

INICIO:
STO, R13, 16'b0 // contador 1

// Esperar que LCD esté lista
LOOP1:
  STO, R12, 16'b0 // contador 2
  NOP,24'd0
  LOOP2:
    ADD, R12, R12, R1
    BLE, LOOP2, R12, R15
  ADD, R13, R13, R1
  BLE, LOOP1, R13, R14

// Escribir en LCD
LCD, 8'b0, R10, 8'b0

LOOPINFINITO:
BLE, LOOPINFINITO, R0, R1
NOP,24'd0
JMP, INICIO, 16'd0
