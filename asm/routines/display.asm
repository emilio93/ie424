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
// T1= R11 + R12 * R13
DISPLAY:
  NOP, 30'b0
  PUSH, 20'b0, RA

  NOP, 30'b0
  MUL, T1, R12, R13
  NOP, 30'b0
  ADD, T1, T1, R11

  NOP, 30'b0
  VGA, 10'b0, R10, T1

  POP, RA, 20'b0
  NOP, 30'b0
  RET, 20'b0, RA
