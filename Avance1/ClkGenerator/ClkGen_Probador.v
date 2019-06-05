//IE-0523 Circuitos Digitales II
//Proyecto1. Módulo Probador de Generador de Relojs.
//Elaborado por el estudiante: César Valverde Zuñiga	A86605		
//I Ciclo 2019

// Este módulo genera las señales de reloj del dispositivo.

module ClkGen_Probador(input clk2f, 
						input clkf,
						input clk2fe,
						input clkfe,
						output reg reset_L, 
						output reg clk8f
						);

initial clk8f <=0;
always begin
	#2 clk8f <= ~clk8f;
end

initial begin
	$dumpfile("ClkGen.vcd");
	$dumpvars;

	reset_L = 1'b0;

	repeat (1) begin
	@(posedge clk8f);
	reset_L <= 1'b1;
	end

	repeat (75) begin
	@(posedge clk8f);

	end

	$finish;
end

endmodule

