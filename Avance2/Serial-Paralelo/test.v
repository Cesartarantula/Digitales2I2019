module ParaleloSerial	(	input 				clk8f,
							input 				clk2f,
							input 				reset,
							input 				reset_L,
							input [8:0] 		paralelo,
							output reg	serial
						);
	reg [1:0] counterbc;
	reg [2:0] counterdata;

	always @ (posedge clk8f) begin
		counterbc<= paralelo[8]==0 ? counterbc+1 : counterbc;
		counterdata<=  paralelo[8]==1 ? counterdata+1 : counterdata;
		if(!reset_L)begin
			counterbc<=0;
			counterdata<=0;
		end
	end
	
	always @(*) begin
	if(paralelo[8]==0)
	begin
		case(counterbc)
		1'b1:	serial = 1'b1;
		1'b0:	serial = 1'b0;
		1'b1:	serial = 1'b1;
		1'b1:	serial = 1'b1;
		1'b1:	serial = 1'b1;
		1'b1:	serial = 1'b1;
		1'b0:	serial = 1'b0;
		1'b0:	serial = 1'b0;
		default:serial = 1'b0;
		endcase
	end
	else
	begin
		case(counterdata)
		3'b000: begin
			serial= paralelo[7];
			end

		3'b001: begin
			serial = paralelo[6];
			end

		3'b010: begin
			serial = paralelo[5];
		       end

		3'b011: begin
			serial = paralelo[4];
			end
			
		3'b100: begin
			serial= paralelo[3];
			end

		3'b101: begin
			serial= paralelo[2];
			end

		3'b110: begin
			serial= paralelo[1];
		       end

		default: begin
			serial= paralelo[0];
			end
		endcase
	end
	end

endmodule
