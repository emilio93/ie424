/*
Modulo vga se encarga de generar las señales red, green, blue, hsync y vsync
para mostrar de manera adecuada una imagen almacenada en una memoria accecible
con la posicion horizontal y vertical de cada pixel de la pantalla(640x480 pixeles)

Genera las señales HS y VS para indicar los saltos horizontales y verticales, estas
señales están en funcionamiento constante.

Se generan contadores de la posicion x, y en la pantalla, de esta manera se puede
conectar fácilmente con una memoria.

La entrada rgb son los valores leidos de la memoria para desplegar en la pantalla.

Se requiere un clk de 25MHz.

La señal de reset no tiene efecto puesto que el módulo puede comenzar sin utilizar
esta señal.
*/
module VGA(
  input wire clk,
  input wire rst,
  input wire [2:0] rgb,
  output reg [9:0] oCtrH, oCtrV,
  output reg RED, GREEN, BLUE, HS, VS
);
  // parameter SCREEN_HEIGHT = 478; // 480;

  /*        lineas   pixeles/linea   pixeles @ 25MHz
    bp vert 10     * 800           = 8000            = 320us
	 pw vert 2      * 800           = 1600            = 64us
    fp vert 29     * 800           = 23200           = 1056us
	 disp    480    * 800           = 384000          = 1536us
	 ------- 521    * 800           = 416800          =


	         pixeles @ 25MHz
    bp hori 16
	 pw hori 96
    fp hori 48
	 disp    640
	 ------- 800


	  bp     pw         fp         disp      bp
	 |--|------------|------|------...------|--|--...
	 ___              _________________________
 SYNC  \____________/                         \______


	          _______     _______     _______
	 vert ___/       \___/       \___/       \___
	        _   _   _   _   _   _   _   _   _   _
	 hori _/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_
  */
  parameter [18:0] tdisph = 19'd640,    // ciclos de despliegue horizontal
                   tpwh = 19'd96,       // ciclos de pulso sync horizontal
                   tfph = 19'd16,       // ciclos de front porch horizontal
                   tbph = 19'd48,       // ciclos de back porch horizontal
                   tpwv = 19'd1600,     // ciclos de despliegue vertical
                   tfpv = 19'd8000,     // ciclos de pulso sync vertical
                   tbpv = 19'd23200,    // ciclos de front porch vertical
                   tdispv = 19'd384000; // ciclos de back porch vertical

  parameter [10:0] screen_height = 11'd480,     // lineas de despliegue vertical
                   screen_height_max = 11'd521, // lineas recorridas vericalmente
                   screen_width_max = 11'd800; // total de pixeles recorridos horizontalmente

  reg [18:0] rCtrV; // Contador tiempos verticales se usa para generar señal VS
  reg [9:0] rCtrH; // Contador de pixeles recorridos horizontalmente(0-799), se usa para generar HS y oCtrH.
  reg [9:0] rVerticalCount; // Contador de lineas recorridas verticalmente(0-520)


  // logica de salida para contadores en formato 640x480
  always @ (*) begin

    // Señales de color desplegado se activan unicamente en tdisph
    if (rVerticalCount>30 & rVerticalCount < 510 & rCtrH > tbph & rCtrH < tbph+tdisph+1) begin
	   {RED, GREEN, BLUE} = rgb;
	 end else begin
	   {RED, GREEN, BLUE} = 3'b0;
	 end

    // pixel en que se encuentra de manera horizontal
    // si no es una posición valida, indica 0
	 if (rCtrH > tbph & rCtrH < (tbph+tdisph)) begin
	   oCtrH = rCtrH-tbph;
	 end else begin
	   oCtrH = 0;
	 end

    // posición de linea vertical
	 if (rVerticalCount > 30 & rVerticalCount < 510) begin
	   oCtrV = rVerticalCount-30;
	 end else begin
	   oCtrV = 0;
	 end
  end

  // Generacion de senales VS y HS
  always @ (posedge clk) begin

    // Generacion de HS
    // durante los lapsos de front porch, back porch y display
    // la señal se mantient en alto, durante pulse width se
    // pone en bajo
    // se tiene un contador para conocer la posicion
    // el contador se resetea cada vez que se cumpla un ciclo
    // back porch, display, front porch, pulse width.
	 if (rCtrH < (tbph+tdisph+tfph)) begin
		HS <= 1'b1;
		rCtrH <= rCtrH + 1;
	 end else if (rCtrH < (tbph+tdisph+tfph+tpwh)-1) begin
		HS <= 1'b0;
		rCtrH <= rCtrH + 1;
	 end else begin
		rCtrH <= 0;
	 end

    // Generacion de VS
    // mismo funcionamiento que para HS, se utilizan
    // tiempos para lapsos verticales
	if (rCtrV < ((tbpv+tdispv+tfpv))) begin
		VS <= 1'b1;
		rCtrV <= rCtrV + 1;
	 end else if (rCtrV < (tbpv+tdispv+tfpv+tpwv)-1) begin
		VS <= 1'b0;
		rCtrV <= rCtrV + 1;
    end else begin
      rCtrV <= 1'b0;
    end
  end

  // contador de lineas
  // se utiliza para obtener la posición
  // vertical
  always @ (posedge HS or negedge VS) begin
    if(~VS) rVerticalCount <= 0;
    else rVerticalCount <= rVerticalCount+1;
  end

endmodule
