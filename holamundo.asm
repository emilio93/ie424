NOP,24'd4000
STO, R0, 16'b0 // cero
STO, R1, 16'b1 // uno
STO, R10, H // H
// Escribir en LCD
LCD, 8'b0, R10, 8'b0
// se requiere nop luego
// de operacion lcd
// con el fin de esperar
// que lcd haya escrito
NOP, 24'b0
