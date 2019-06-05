//IE-0523 Circuitos Digitales II
//Proyecto1. Módulo Test_bench del ByteStriping.
//Elaborado por el estudiante: César Valverde Zuñiga	A86605		
//I Ciclo 2019

`timescale 1ns / 100ps
`include "ClkGenerator.v"
`include "ByteStriping.v"
`include "ByteStrip_Probador.v"
`include "ByteStripingEstructural.v"
`include "cmos_cells.v"

module Test_Bench;

	wire reset_L, clkf, clk2f, clk8f;
	wire [8:0] lane0, lane1, datain0;

	//Instancia modulo ClkGenerator
	ClkGenerator	 CG 	( 	.clk8f	(clk8f),
								.reset_L(reset_L),
								.clk2f	(clk2f),
								.clkf 	(clkf)
	);
	
	//Instancia del módulo Byte Striping Conductual
	ByteStriping BS(	//.clk8f	(clk8f),
				.clk2f	(clk2f),
				.clkf 	(clkf),
				.reset_L(reset_L),
				.datain0 (datain0),
				.lane0 (lane0),
				.lane1 (lane1)
	);

	//Instancia del módulo Byte Striping Estrutural
	ByteStripingEstructural BSEstr(	//.clk8f	(clk8f),
				.clk2f	(clk2f),
				.clkf 	(clkf),
				.reset_L(reset_L),
				.datain0 (datain0),
				.lane0 (lane0),
				.lane1 (lane1)
	);
	
	//Instancia del Probador Byte Striping
	ByteStrip_Probador PByte(	.clk2f (clk2f), 
					.clkf (clkf),
					//.lane0 (lane0),
					//.lane1 (lane1),
					.reset_L (reset_L), 
					.clk8f (clk8f),
					.datain0 (datain0)
	);


endmodule
