module ByteStrip_Probador(		        input clk2f, 
						input clkf,
						input [8:0] lane0,
						input [8:0] lane1,
						output reg reset_L, 
						output reg clk8f,
						output reg [8:0] datain0
						);

initial clk8f <=0;
always begin
	#2 clk8f <= ~clk8f;
end

initial begin
	$dumpfile("ByteStriping.vcd");
	$dumpvars;

	reset_L <= 1'b0;
	@(posedge clk2f)
	datain0 <= 9'b100001100;

	#10 reset_L <= 1'b1;

	@(posedge clk2f)
	datain0 <= 9'b100001111;

	@(posedge clk2f)
	datain0 <= 9'b100010001;

	@(posedge clk2f)
	datain0 <= 9'b100010111;

	@(posedge clk2f)
	datain0 <= 9'b000010001;
	
	@(posedge clk2f)
	datain0 <= 9'b000010001;

	@(posedge clk2f)
	datain0 <= 9'b100001100;

	@(posedge clk2f)
	datain0 <= 9'b100001111;

	@(posedge clk2f)
	datain0 <= 9'b000100001;
	
	@(posedge clk2f)
	datain0 <= 9'b001000001;

	@(posedge clk2f)
	datain0 <= 9'b100010001;

	@(posedge clk2f)
	datain0 <= 9'b100010111;

	@(posedge clk2f)
	datain0 <= 9'b100001100;

	@(posedge clk2f)
	datain0 <= 9'b100001111;

	@(posedge clk2f)
	datain0 <= 9'b000010001;
	
	@(posedge clk2f)
	datain0 <= 9'b000010001;
	
	@(posedge clk2f)
	datain0 <= 9'b100010111;

	@(posedge clk2f)
	datain0 <= 9'b100001111;

	@(posedge clk2f)
	datain0 <= 9'b000001100;
	
	@(posedge clk2f)
	datain0 <= 9'b000001100;

	@(posedge clk2f)
	datain0 <= 9'b100001111;

	@(posedge clk2f)
	datain0 <= 9'b100010001;

	@(posedge clk2f)
	datain0 <= 9'b100111111;

	@(posedge clk2f)
	datain0 <= 9'b100011001;

	#10000 $finish;
end

endmodule

