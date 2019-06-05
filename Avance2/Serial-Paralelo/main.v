//IE-0523 Circuitos Digitales II
//Proyecto1. Bloque Modulo Main de Serial a Paralelo.
//Elaborado por: César Valverde Zuñiga	A86605		
//I Ciclo 2019

//Módulo Serial a Paralelo
//En este módulo se tiene por entrada una serie de un "1" bit a frecuencia 8f, que describe un número de 8 bits
//  + 1 bit de valid, por salida se tiene el número recibido de 8 bits y su bit de válido hacia la etapa de 
// demuxes 

module serialParalelo(input clk8 , input reset8,input serial,output reg [8:0] outParalelo);

   wire [7:0] paralelo; // Registro para guardar el número de 8-bits que entra
   reg [2:0] contador; // Contador de Bc's
   reg i, ser1,ser2,ser3,ser4,ser5,ser6,ser7,ser8;
   
   wire      com, active,valid; // variables para asignar bit de válido
   
   //Toma las entrada de 1 bit y las asigna al registro paralelo en orden
   always @(posedge clk8) 
     begin
	
	if(~reset8) // Inicialmente el contador y el número paralelo son 0
	  begin
	     contador <= 3'b00;
	     i <= 1'b0;
	     ser1 <=0;
   	     ser2 <=0;
	     ser3 <=0;
	     ser4 <=0;
	     ser5 <=0;
   	     ser6 <=0;
	     ser7 <=0;
	     ser8 <=0;
	     outParalelo <= 0;
	 end
	else
	begin
		contador <= contador > 4 ? 5 : (paralelo==8'b10111100 && i == 1'b1) ? contador+1:contador; //Reviso si tengo BC en la entrada
		i <= (i == 1'b1) ? 0 : i+1;// si i es 1 lo vuelvo a 0
		ser1 <= (i == 1'b1) ? serial : ser1; //Conditional ? e.g. (2>3) ? 1 : 0
		ser2 <= (i == 1'b0) ? serial : ser2;
		ser3 <= (i == 1'b1) ? serial : ser3;
		ser4 <= (i == 1'b1) ? serial : ser4;
		ser5 <= (i == 1'b1) ? serial : ser5;
		ser6 <= (i == 1'b1) ? serial : ser6;
		ser7 <= (i == 1'b0) ? serial : ser7;
		ser8 <= (i == 1'b0) ? serial : ser8;  
		outParalelo[8] <= (i == 1'b1) ?  valid : outParalelo[8];
		outParalelo[7:0] <= (i == 1'b1) ? (com ? paralelo : outParalelo[7:0] ): outParalelo[7:0] ;
	end
		
     end 
 
   assign paralelo = {ser1,ser2,ser3,ser4,ser5,ser6,ser7,ser8};
   assign active = (contador >=4) ? 1 : 0;
   assign com = (paralelo!=8'b10111100) ? 1 : 0;
   assign valid = active && com;
endmodule
  
