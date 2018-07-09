NOP,24'd4000
STO, R0, 16'b0 // cero
STO, R1, 16'b1 // uno

INICIO:

// Contadores
STO, R11, 16'b0 // horizontal
STO, R12, 16'b0 // vertical

// LIMITES
STO, R13, 16'd40 // horizontal
STO, R14, 16'd30 // vertical



// width = 16, height = 12
//
// linea   |     xxxx    xxxx    xxxx    xxxx|  //
// blanca  |     xxxx    xxxx    xxxx    xxxx|  //
// linea   | xxxx    xxxx    xxxx    xxxx    |  //
// negra   | xxxx    xxxx    xxxx    xxxx    |  //
//         |     xxxx    xxxx    xxxx    xxxx|  //
//         |     xxxx    xxxx    xxxx    xxxx|  //
//         | xxxx    xxxx    xxxx    xxxx    |  //
//         | xxxx    xxxx    xxxx    xxxx    |  //
//         |     xxxx    xxxx    xxxx    xxxx|  //
//         |     xxxx    xxxx    xxxx    xxxx|  //
//         | xxxx    xxxx    xxxx    xxxx    |  //
//         | xxxx    xxxx    xxxx    xxxx    |  //
//



    CALL, LOOPVERTICAL, 16'b0

    // TECLAS
    STO, R2, 16'h1B // abajo
    STO, R3, 16'h1D // arriba

    // Contadores
    STO, R11, 16'd15 // horizontal
    STO, R12, 16'd5 // vertical

    STO, R10, 8'b0, COLOR_RED
    CALL, DISPLAY, 16'b0

    LOOPTEC:
    STO, R20, 16'b0
    NOP, 24'b0
    TEC, R20, 16'b0
    NOP, 24'b0
    BEQ, ARRIBA, R20, R3
    BEQ, ABAJO, R20, R2
    JMP, LOOPTEC, 16'b0

    LOOPTECDOWN:
    STO, R20, 16'b0
    NOP, 24'b0
    TEC, R20, 16'b0
    NOP, 24'b0
    BEQ, ARRIBA, R20, R3
    JMP, LOOPTECDOWN, 16'b0

    LOOPTECUP:
    STO, R20, 16'b0
    NOP, 24'b0
    TEC, R20, 16'b0
    NOP, 24'b0
    BEQ, ABAJO, R20, R2
    JMP, LOOPTECUP, 16'b0

    ARRIBA:
    STO, R10, 8'b0, COLOR_BLACK
    CALL, DISPLAY, 16'b0
    STO, R10, 8'b0, COLOR_RED
    STO, R12, 16'd4
    CALL, DISPLAY, 16'b0
    JMP, LOOPTECUP, 16'b0
    ABAJO:
    STO, R10, 8'b0, COLOR_BLACK
    CALL, DISPLAY, 16'b0
    STO, R10, 8'b0, COLOR_RED
    STO, R12, 16'd6
    CALL, DISPLAY, 16'b0
    JMP, LOOPTECDOWN, 16'b0


    PAINTRED:
    CALL, LOOPVERTICAL, 16'b0
    STO, R10, 8'b0, COLOR_RED
    CALL, DISPLAY, 16'b0
    JMP, LOOPTEC, 16'b0

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
// T1= R11 + R12 * R13
DISPLAY:
  NOP, 24'b0
  PUSH, 16'b0, RA
  PUSH, 16'b0, R2

  STO, R2, 16'b0 // indica que se empieza con un cuadro blanco
  NOP, 24'b0

  BLE, DISPLAY_DO_VER, R12, R14
  JMP, DISPLAY_END, 16'b0
  DISPLAY_DO_VER:
  BLE, DISPLAY_DO_HOR, R11, R13
  JMP, DISPLAY_END, 16'b0

  DISPLAY_DO_HOR:
  NOP, 24'b0
  MUL, T1, R12, R13
  NOP, 24'b0
  ADD, T1, T1, R11

  NOP, 24'b0
  VGA, 8'b0, R10, T1

  DISPLAY_END:
  POP, R2, 16'b0
  POP, RA, 16'b0
  NOP, 24'b0
  RET, 16'b0, RA








LOOPVERTICAL:
  NOP, 24'b0
  PUSH, 16'b0, RA
  PUSH, 16'b0, R2
  PUSH, 16'b0, R10
  PUSH, 16'b0, R11
  PUSH, 16'b0, R12
  NOP, 24'b0

  STO, R12, 16'b0

  LOOPVERTICALA:
  STO, R11, 16'b0
  NOP, 24'b0
  LOOPHORIZONTAL:
    ADD, T1, R11, R12
    NOP, 24'b0
    AND, T1, R1, T1
    NOP, 24'b0
    BEQ, CUADROBLANCO, T1, R0
    JMP, CUADRONEGRO, 16'b0

    CUADROBLANCO:
      STO, R10, 8'b0, COLOR_WHITE
      JMP, LOOPREGRESOHORIZONTAL, 16'b0

    CUADRONEGRO:
      STO, R10, 8'b0, COLOR_BLACK
      JMP, LOOPREGRESOHORIZONTAL, 16'b0

    LOOPREGRESOHORIZONTAL:
      CALL, DISPLAY, 16'b0
      ADD, R11, R11, R1
      BLE, LOOPHORIZONTAL, R11, R13
      ADD, R12, R12, R1
      BLE, LOOPVERTICALA, R12, R14

  POP, R12, 16'b0
  POP, R11, 16'b0
  POP, R10, 16'b0
  POP, R2, 16'b0
  POP, RA, 16'b0
  NOP, 24'b0
  RET, 16'b0, RA
