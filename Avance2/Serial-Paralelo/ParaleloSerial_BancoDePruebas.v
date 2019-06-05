`timescale 100ns / 100ps
`include "ClkGenerator.v"
`include "test.v"
`include "main.v"
`include "mainSynth.v"
`include "ParaleloSerial_Probador.v"
`include "cmos_cells.v"

module Test_Bench;

	wire [8:0] paralelo, serial,spEst;
	wire serialCond;
	wire clk8f, clk2f,reset_L,reset;
	
	//Instancia modulo Serial Paralelo Conductual
	serialParalelo SPConductual(.clk8(clk8f) , .reset8(reset_L) ,.serial(serialCond),.outParalelo(serial));

	//Instancia modulo Serial Paralelo EStructural
	serialParaleloEst SPEstructural(.clk8(clk8f) , .reset8(reset_L) ,.serial(serialCond),.outParalelo(spEst));

	//Instancia modulo ClkGenerator
	ClkGenerator	 			ClkGen 			( 	.clk8f	(clk8f),
													.reset_L(reset_L),
													.clk2f	(clk2f)
	);

	//Instancia modulo conductual Paralelo Serial
	ParaleloSerial	 			PSConductual	(	.clk8f		(clk8f),
													.clk2f 		(clk2f),
													.reset		(reset),
													.paralelo	(paralelo),
													.serial 	(serialCond),
													.reset_L	(reset_L)
	);

	

	//Instancia probador
	ParaleloSerial_Probador	 PS_Probador 		( 	.serialcond		(serialCond),
													.paralelo		(paralelo),
													.serial			(serial),
													.spEst			(spEst),
													.reset			(reset),
													.reset_L 		(reset_L),
													.clk2f			(clk2f),
													.clk8f			(clk8f)
	);

endmodule
