NOP,24'd4000
STO, R0, 16'b0 // cero
STO, R1, 16'b1 // uno

FONDO:
PUSH, 16'b0, RA
PUSH, 16'b0, R11
PUSH, 16'b0, R12
PUSH, 16'b0, R13
PUSH, 16'b0, R14

// Contadores
STO, R11, 16'b0 // horizontal
STO, R12, 16'b0 // vertical

// LIMITES
STO, R13, 16'd40 // horizontal
STO, R14, 16'd30 // vertical

NOP, 24'b0
CALL, PONER_CIELO_DIA, 16'b0
STO, R14, 16'd30
CALL, PONER_ZACATE, 16'b0
NOP, 24'd0
CALL, PINTAR_SOL, 16'b0
NOP, 24'b0

POP, R14, 16'b0
POP, R13, 16'b0
POP, R12, 16'b0
POP, R11, 16'b0
POP, RA, 16'b0
NOP, 24'b0
RET, RA, 16'b0
