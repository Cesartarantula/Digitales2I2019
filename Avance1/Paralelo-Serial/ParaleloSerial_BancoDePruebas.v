`timescale 1ns/100ps
`include "ClkGenerator.v"
`include "ParaleloSerial.v"
`include "ParaleloSerialEstructural.v"
`include "ParaleloSerial_Probador.v"
`include "cmos_cells.v"

module Test_Bench;

	wire [8:0] paralelo;
	wire serialCond;
	wire serialEst;
	wire clk8f, clk2f, clkf, reset_L,reset;

	//Instancia modulo ClkGenerator
	ClkGenerator	 			ClkGen 			( 	.clk8f	(clk8f),
													.reset_L(reset_L),
													.clk2f	(clk2f),
													.clkf 	(clkf)
	);

	//Instancia modulo conductual Paralelo Serial
	ParaleloSerial	 			PSConductual	(	.clk8f		(clk8f),
													.clkf 		(clkf),
													.reset		(reset),
													.paralelo	(paralelo),
													.serial 	(serialCond),
													.reset_L	(reset_L)
	);

	//Instancia modulo estructural Paralelo Serial
	ParaleloSerialEstructural	 PSEstructural	(	.clk8f		(clk8f),
													.clkf 		(clkf),
													.reset		(reset),
													.paralelo	(paralelo),
													.serial 	(serialEst),
													.reset_L	(reset_L)
	);



	//Instancia probador
	ParaleloSerial_Probador	 PS_Probador 		( 	.serialcond		(serialCond),
													.serialest 		(serialEst),
													.paralelo		(paralelo),
													.reset			(reset),
													.reset_L 		(reset_L),
													.clkf			(clkf),
													.clk8f			(clk8f)
	);

endmodule
