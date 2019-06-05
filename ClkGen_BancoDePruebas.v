//IE-0523 Circuitos Digitales II
//Proyecto1. Módulo Test_bench del Generador de Relojs.
//Elaborado por el estudiante: César Valverde Zuñiga	A86605		
//I Ciclo 2019

`timescale 1ns / 100ps
`include "ClkGenerator.v"
`include "ClkGeneratorEstructural.v"
`include "ClkGen_Probador.v"
`include "cmos_cells.v"


module Test_Bench;

	//Instancia modulo ClkGenerator
	ClkGenerator	 CG 	( 	.clk8f	(clk8f),
								.reset_L(reset_L),
								.clk2f	(clk2f),
								.clkf 	(clkf)
	);

	//Instancia modulo ClkGenerator Estructural
	ClkGeneratorEstructural	 CGEst 	( 	.clk8f	(clk8f),
										.reset_L(reset_L),
										.clk2f	(clk2fest),
										.clkf 	(clkfest)
	);

	//Instancia probador
	ClkGen_Probador	 CG_Probador( 	.clk8f	(clk8f),
									.clk2f	(clk2f),
									.clkf 	(clkf),
									.reset_L(reset_L),
									.clk2fe	(clk2fest),
									.clkfe (clkfest)

	);

endmodule
