`timescale 1ns/100ps
`include "cmos_cells.v"
`include "synth_mux.v"
module tb();
	wire clk;
	wire reset_L;
	wire [7:0]data_in_0;
	wire [7:0]data_in_1;
	wire valid_in_0;
	wire valid_in_1;
	wire valid_out;
	wire [7:0] data_out;
	mux mx(clk, reset_L, data_in_0, data_in_1, valid_in_0, valid_in_1, valid_out, data_out);
	mux_synth MXsynth(clk, reset_L, data_in_0, data_in_1, valid_in_0, valid_in_1, valid_out, data_out);
	probar	proba(clk, reset_L, data_in_0, data_in_1, valid_in_0, valid_in_1, valid_out, data_out);	
	
	initial

		begin
		$dumpfile("mux.vcd");
		$dumpvars;
			$display("clk reset_L data_in_0 data_in_1 valid_in_0 valid_in_1 valid_out data_out");
			$monitor("%b %b %b %b %b %b %b %b", clk, reset_L, data_in_0, data_in_1, valid_in_0, valid_in_1, valid_out, data_out);

		end

endmodule
