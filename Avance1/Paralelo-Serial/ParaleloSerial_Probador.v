module ParaleloSerial_Probador	(	input serialcond,
									input serialest,
									input clkf,
									output reg [8:0] paralelo,
									output reg reset,
									output reg reset_L,
									output reg clk8f
								);

initial clk8f <=0;
always begin
	#500 clk8f <= ~clk8f;
end

initial begin
	$dumpfile("ParaleloSerial.vcd");
	$dumpvars;

	reset = 1'b1;
	reset_L = 1'b0;

	repeat (1) begin
	@(posedge clk8f);
	reset_L <= 1'b1;
	end

	repeat (1) begin
	@(posedge clkf);
		paralelo <= 9'b111111111;//$FF valido
	end

	repeat (1) begin
	@(posedge clkf);
		paralelo <= 9'b101010101;//$55 valido
		reset <= 1'b0;
	end


	repeat (1) begin
	@(posedge clkf);
		paralelo <= 9'b100000000;//$00 valido 
	end

	repeat (1) begin
	@(posedge clkf);
		paralelo <= 9'b111111111;//$FF valido
	end

	repeat (1) begin
	@(posedge clkf);
		paralelo <= 9'b011111111;//$FF invalido
	end

	repeat (1) begin
	@(posedge clkf);
		paralelo <= 9'b001010101;//$55 invalido
	end


	repeat (1) begin
	@(posedge clkf);
		paralelo <= 9'b100000000;//$00 valido 
	end

	repeat (2) begin
	@(posedge clkf);

	end

	$finish;
end

endmodule

