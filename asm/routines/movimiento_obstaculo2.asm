// Esta es la lógica del juego
//
// Define el estado del juego
//
//
//  - posicion x obstaculo
//  - posicion y obstaculo
//  - tamaño x obstaculo
//  - tamaño y obstaculo
//
//  - puntuación
//  - nivel[velocidad obstaculo]
//  - horario[dia/noche]
//  - estado[inicio/juego/derrota]
//
//

// R24 y R25 son la posicion actual XY del obstáculo. 
// El obstaculo se mueve de manera constante

MOVIMIENTO_OBST2:
  NOP, 30'b0
  PUSH, 20'b0, RA

  CALL, BORRAR_OBSTACULO2, 20'b0
  BLE, NON_RESET_OBST2, R1, R22
  STO, R22, 20'd35
  CALL, PINTAR_OBSTACULO2, 20'b0
	JMP, TERMINAR_OBST_MOV2, 20'b0
  NON_RESET_OBST2:
		SUB, R22, R22, R1 //posicion X reducida en 1.
		CALL, PINTAR_OBSTACULO2, 20'b0
		CALL, PINTAR_JUGADOR, 20'b0
		JMP, TERMINAR_OBST_MOV2, 20'b0


  TERMINAR_OBST_MOV2:
    POP, RA, 20'b0
    NOP, 30'b0
    RET, 20'b0, RA
