module ParaleloSerial	(	input 				clk8f,
							input 				clkf,
							input 				reset,
							input 				reset_L,
							input [8:0] 		paralelo,
							output reg	serial
						);
	//Registros Internos
	reg [1:0] counterbc;
	reg [3:0] counterdata;

	always @ (posedge clk8f) begin

		if(!reset_L)begin
			counterbc<=0;
			counterdata<=0;
			serial <=0;
		end

		else begin
		//Envio de los $BC
		//Si el reset esta en alto o el valid del dato
		//esta en cero entonces mande $BC's
		if(reset || paralelo[8] == 0)begin
			if(counterbc == 0)begin
				serial <= 1'b0;
				counterbc <= counterbc +1;
			end

			if(counterbc == 1)begin
				serial <= 1'b0;
				counterbc <= counterbc +1;
			end

			if(counterbc == 2)begin
				serial <= 1'b1;
				counterbc <= counterbc +1;
			end

			if(counterbc == 3)begin
				serial <= 1'b1;
				counterbc <= counterbc +1;;
			end
			if(counterbc == 4)begin
				serial <= 1'b1;
				counterbc <= counterbc +1;;
			end
			if(counterbc == 5)begin
				serial <= 1'b1;
				counterbc <= counterbc +1;;
			end
			if(counterbc == 6)begin
				serial <= 1'b0;
				counterbc <= counterbc +1;;
			end
			if(counterbc == 7)begin
				serial <= 1'b0;
				counterbc <= counterbc +1;;
			end
			if(counterbc == 8)begin
				serial <= 1'b1;
				counterbc <= 0;
			end
	
		end
		else begin

			//Envio de los datos cuando su bit de valid es 1
			if(paralelo[8] == 1)begin

				if(counterdata == 0)begin
					serial <= paralelo[7];
					counterdata <= counterdata +1;
				end
				if(counterdata == 1)begin
					serial <= paralelo[6];
					counterdata <= counterdata +1;
				end
				if(counterdata == 2)begin
					serial <= paralelo[5];
					counterdata <= counterdata +1;
				end
				if(counterdata == 3)begin
					serial <= paralelo[4];
					counterdata <= counterdata +1;
				end
				if(counterdata == 4)begin
					serial<= paralelo[3];
					counterdata <= counterdata +1;
				end
				if(counterdata == 5)begin
					serial <= paralelo[2];
					counterdata <= counterdata +1;
				end
				if(counterdata == 6)begin
					serial <= paralelo[1];
					counterdata <= counterdata +1;
				end
				if(counterdata == 7)begin
					serial <= paralelo[0];
					counterdata <= 0;
				end
			end
		end		
		end
	end 
 
endmodule