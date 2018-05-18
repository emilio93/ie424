NOP,24'd4000
STO, R0, 16'b0 // cero
STO, R1, 16'b1 // uno

INICIO:

STO, R10, H // H
STO, R11, O // O
STO, R12, L // L
STO, R13, A // A
CALL, ESCRIBIRLCD, 16'b0

STO, R10, ESPACIO //
STO, R11, M //
STO, R12, U //
STO, R13, N //
CALL, ESCRIBIRLCD, 16'b0

STO, R10, ESPACIO //
STO, R11, D //
STO, R12, O //
STO, R13, ESPACIO //
CALL, ESCRIBIRLCD, 16'b0

LOOPINFINITO:
BLE, LOOPINFINITO, R0, R1
NOP,24'd0
JMP, INICIO, 16'd0

ESCRIBIRLCD:
NOP, 24'b0
// Escribir en LCD
LCD, 8'b0, R10, 8'b0
// se requiere nop luego operacion lcd
// con el fin de esperar que lcd haya escrito
NOP, 24'b0
LCD, 8'b0, R11, 8'b0
NOP, 24'b0
LCD, 8'b0, R12, 8'b0
NOP, 24'b0
LCD, 8'b0, R13, 8'b0
NOP, 24'b0
RET, 16'b0, RA
