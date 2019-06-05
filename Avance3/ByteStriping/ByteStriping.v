//IE-0523 Circuitos Digitales II
//Proyecto1. Bloque Byte Striping.
//Elaborado por: César Valverde Zuñiga	A86605		
//I Ciclo 2019

// Este módulo genera las salidas lane0 y lane1, recibiendo como entrada datain0 a una frecuenia de 2f.

//`timescale 1ns/100ps

module ByteStriping(		input clk2f,
				input clkf,
				input reset_L,
				input [8:0] datain0,
				output reg [8:0] lane0,
				output reg [8:0] lane1
);

        //Registros Internos
	reg selectorL1=1;

	always @(posedge clkf) begin
		selectorL1 <= ~selectorL1;
		if((!reset_L)||(datain0[8] == 0))begin
		lane0 <= 0;
		lane1 <= 0;
		end
		else begin
			if(~selectorL1)begin
			lane0 <= datain0;
			end
			else begin
			lane1 <= datain0;
			end
		end
	end

	always @(posedge clk2f) begin
		selectorL1 <= ~selectorL1;
		if((!reset_L)||(datain0[8] == 0))begin
		lane0 <= 0;
		end
		else begin 
			if(~selectorL1)begin
			lane0 <= datain0;
			end
			else begin
			lane1 <= datain0;
			end
		end
	end

endmodule