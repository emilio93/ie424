// Esta es la lógica del juego
//
//Se chequea si el jugador ha perdido el juego 
//verificando si hay colisión
CHEQUEAR_DERROTA:
  NOP, 30'b0
  PUSH, 20'b0, RA
  STO, T1, 20'd19
  STO, T2, 20'd24
  STO, T3, 20'd6
  
  
	BEQ, PLAYER_UP, R21, T1
	BEQ, PLAYER_DOWN, R21, T2
	
	PLAYER_UP:
		BEQ, DERROTADO, R24, T3
		SUB, T3, T3, R1
		NOP, 30'b0
		BEQ, DERROTADO, R24, T3
		SUB, T3, T3, R1
		NOP, 30'b0
		BEQ, DERROTADO, R24, T3
		NOP, 30'b0
		JMP, NO_DERROTA, 20'd0
	
	PLAYER_DOWN:
		BEQ, DERROTADO, R22, T3
		SUB, T3, T3, R1
		NOP, 30'b0
		BEQ, DERROTADO, R22, T3
		SUB, T3, T3, R1
		NOP, 30'b0
		BEQ, DERROTADO, R22, T3
		NOP, 30'b0
		JMP, NO_DERROTA, 20'd0

	DERROTADO:
		POP, RA, 20'b0
		NOP, 30'b0
		JMP, GAME_LOST, 20'd0
		
	NO_DERROTA:
    POP, RA, 20'b0
    NOP, 30'b0
    RET, 20'b0, RA
