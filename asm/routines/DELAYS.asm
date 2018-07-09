//
// Realiza un retraso de 1us
//
// Cada instrucción tarda 20ns(a 50Mhz)
// Se requieren 1us/20ns = 50 instrucciones
// para el retraso deseado.
//
DELAY_US_FIX:
  NOP, 24'b0
  STO, T1, 16'b0
  STO, T2, 16'd20
  DELAY_US_FIX_LOOP_1:
    ADD, T1, T1, R1
    BLE, DELAY_US_FIX_LOOP_1, T1, T2
  NOP, 24'b0
  NOP, 24'b0
  RET, 16'b0, RA

//
// Realiza un retraso de 1ms
//
// Cada instrucción tarda 20ns(a 50Mhz)
// Se requieren 1ms/20ns = 50000 instrucciones
// para el retraso deseado.
//
DELAY_MS_FIX:
  NOP, 24'b0
  STO, T1, 16'b0
  STO, T2, 16'd24995
  DELAY_MS_FIX_LOOP_1:
    ADD, T1, T1, R1
    BLE, DELAY_MS_FIX_LOOP_1, T1, T2
  NOP, 24'b0
  NOP, 24'b0
  RET, 16'b0, RA
