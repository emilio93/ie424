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

STO, R3, 16'd2
STO, R4, 16'd5
STO, R5, 16'd8

// width = 16, height = 12
//
//  gggggggggggggg
//  rrrrrrrrrrrrrr
//  mmmmmmmmmmmmmm
//  bbbbbbbbbbbbbb
//
LOOPVERTICAL:
  STO, R11, 16'b0 // horizontal
  LOOPHORIZONTAL:
    STO, R10, 8'b0, COLOR_GREEN
    BLE, REGRESOLOOPHORIZONTAL, R12, R3
    STO, R10, 8'b0, COLOR_RED
    BLE, REGRESOLOOPHORIZONTAL, R12, R4
    STO, R10, 8'b0, COLOR_MAGENTA
    BLE, REGRESOLOOPHORIZONTAL, R12, R5
    STO, R10, 8'b0, COLOR_BLUE
    JMP, REGRESOLOOPHORIZONTAL, 16'b0

  REGRESOLOOPHORIZONTAL:
    BLE, REGRESOLOOPVERTICAL, R13, R11
    CALL, DISPLAY, 16'b0
    ADD, R11, R11, R1
    JMP, LOOPHORIZONTAL, 16'b0

REGRESOLOOPVERTICAL:
  BLE, FIN, R14, R12
  ADD, R12, R12, R1
  JMP, LOOPVERTICAL, 16'b0

FIN:
JMP, FIN, 16'b0

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
// R2= R11 + R12 * R4
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