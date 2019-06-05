//IE-0523 Circuitos Digitales II
//Proyecto1. Bloque Generador de Reloj.
//Elaborado por: César Valverde Zuñiga	A86605		
//I Ciclo 2019

// Este módulo genera las señales de reloj del dispositivo 
// a partir del master clock señal de mayor frecuencia.

//`timescale 1ns/100ps

module ClkGenerator(input 		clk8f,
						input 		reset_L,
						output reg 	clk2f,
						output reg 	clkf
						);

	
        //Registros Internos (Contadores)
	reg counter1;
	reg [1:0] counter2;

	//Reset contadores y relojes 2f y f
	always @ (posedge clk8f) begin
		if(!reset_L)begin
		counter1<=0;
		counter2<=0;
		clk2f<=1;
		clkf<=1;
		end
		else begin

		if(counter1>=1)begin
			clk2f <= ~clk2f;
			counter1<=0;
		end 
		else begin
			counter1<=counter1+1;
		end 

		if(counter2>=3)begin
			clkf <= ~clkf;
			counter2<=0;
		end 
		else begin
			counter2<=counter2+1;
		end	
		end
	end

endmodule