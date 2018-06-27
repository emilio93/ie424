NOP,24'd4000
STO, R0, 16'b0 // cero
STO, R1, 16'b1 // uno

INICIO:

// Contadores
STO, R11, 16'b0 // horizontal
STO, R12, 16'b0 // vertical

// LIMITES
STO, R13, 16'd16 // horizontal
STO, R14, 16'd12 // vertical

STO, R3, 16'd5

// width = 16, height = 12
//
//  gggggggggggggg
//  rrrrrrrrrrrrrr
//  mmmmmmmmmmmmmm
//  bbbbbbbbbbbbbb
//

GAME:
  CALL, DIA, 16'b0
  CALL, SOL, 16'b0

STO, R5, 16'b0
STO, R4, 16'd10000

CALL, WAIT, 16'b0

CALL, NOCHE, 16'b0
CALL, LUNA, 16'b0

CALL, WAIT, 16'b0

JMP, GAME, 16'b0


FIN:
  JMP, FIN, 16'b0

WAIT:
  NOP, 24'b0
  PUSH, 16'b0, RA
  PUSH, 16'b0, R2
  PUSH, 16'b0, R3
  NOP, 24'b0
  STO, R3, 16'b0
  WAIT1:
    STO, R2, 16'b0
    NOP, 24'b0
    WAIT2:
      ADD, R2, R2, R1
      BLE, WAIT2, R2, R4
    ADD, R3, R3, R1
    BLE, WAIT1, R3, R4
  NOP, 24'b0
  POP, R3, 16'b0
  POP, R2, 16'b0
  POP, RA, 16'b0
  NOP, 24'b0
  RET, 16'b0, RA

DIA:
  NOP,24'd0
  PUSH, 16'b0, RA
  STO, R12, 16'b0 // vertical
  LOOPVERTICAL:
    STO, R11, 16'b0 // horizontal
    LOOPHORIZONTAL:
      STO, R10, 8'b0, COLOR_CYAN
      BLE, REGRESOLOOPHORIZONTAL, R12, R3
      STO, R10, 8'b0, COLOR_GREEN
      JMP, REGRESOLOOPHORIZONTAL, 16'b0

    REGRESOLOOPHORIZONTAL:
      BLE, REGRESOLOOPVERTICAL, R13, R11
      CALL, DISPLAY, 16'b0
      ADD, R11, R11, R1
      JMP, LOOPHORIZONTAL, 16'b0

  REGRESOLOOPVERTICAL:
    BLE, RETURNGAME, R14, R12
    ADD, R12, R12, R1
    JMP, LOOPVERTICAL, 16'b0

RETURNGAME:
    POP, RA, 16'b0
    NOP,24'd0
    RET, 16'b0, RA

  SOL:
    NOP,24'd0
    PUSH, 16'b0, RA
    STO, R11, 16'd14
    STO, R12, 16'b1
    STO, R10, 8'b0, COLOR_YELLOW
    CALL, DISPLAY, 16'b0
    POP, RA, 16'b0
    NOP,24'd0
    RET, 16'b0, RA

NOCHE:
  NOP,24'd0
  PUSH, 16'b0, RA
  STO, R12, 16'b0 // vertical
  LOOPVERTICAL2:
    STO, R11, 16'b0 // horizontal
    LOOPHORIZONTAL2:
      STO, R10, 8'b0, COLOR_BLACK
      BLE, REGRESOLOOPHORIZONTAL2, R12, R3
      STO, R10, 8'b0, COLOR_GREEN
      JMP, REGRESOLOOPHORIZONTAL2, 16'b0

    REGRESOLOOPHORIZONTAL2:
      BLE, REGRESOLOOPVERTICAL2, R13, R11
      CALL, DISPLAY, 16'b0
      ADD, R11, R11, R1
      JMP, LOOPHORIZONTAL2, 16'b0

  REGRESOLOOPVERTICAL2:
    BLE, RETURNGAME, R14, R12
    ADD, R12, R12, R1
    JMP, LOOPVERTICAL2, 16'b0

LUNA:
    NOP,24'd0
    PUSH, 16'b0, RA
    STO, R11, 16'd14
    STO, R12, 16'b1
    STO, R10, 8'b0, COLOR_WHITE
    CALL, DISPLAY, 16'b0
    POP, RA, 16'b0
    NOP,24'd0
    RET, 16'b0, RA

// LE ENTRA R10, R11, R12, R13 y R14
// PONE EL COLOR INDICADO EN R10
// EN LA POSICIÓN R11, R12
// R13 ES EL LIMITE HORIONTAL
// R14 ES EL LIMITE VERTICAL
// _______________________
// |
// | 0X0 1X0 2X0 ... nX0
// | 0x1 1x1 2x1 ... nx1
// |  .   .   . .     .
// |  .   .   .    .  .
// |  .   .   .       .
// | 0xm 1xm 2xm ... nxm
// |_____________________
//
// ______________________
// |
// | 0+0n 1+0n 2+0n ... (n-1)+0n
// | 0+1n 1+1n 2+1n ... (n-1)+1n
// | 0+2n 1+2n 2+2n ... (n-1)+2n
// |  .    .    .  .     .
// |  .    .    .     .  .
// |  .    .    .        .
// | 0+mn 1+mn 2+mn  ... (n-1)+nm
// |_____________________
//
// R11=x
// R12=y
// R4=limHor
// R2= R11 + R12 * R13
DISPLAY:
  NOP, 24'b0
  PUSH, 16'b0, RA
  PUSH, 16'b0, R2 // POSICION EN MEM VGA

  NOP, 24'b0
  MUL, R2, R12, R13
  NOP, 24'b0
  ADD, R2, R2, R11

  NOP, 24'b0
  VGA, 8'b0, R10, R2

  POP, R2, 16'b0
  POP, RA, 16'b0
  NOP, 24'b0
  RET, 16'b0, RA
