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

STO, R2, 16'b0 // indica que se empieza con un cuadro blanco
NOP, 24'b0

LOOPVERTICAL:
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
      BLE, LOOPVERTICAL, R12, R14
      JMP, FIN, 16'b0

FIN:
JMP, FIN, 16'b0
