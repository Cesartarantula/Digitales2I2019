`timescale 1ns/100ps
module probar(clk, reset_L, data_in_0, data_in_1, valid_in_0, valid_in_1, valid_out, data_out);
	output reg [7:0]data_in_0;
	output reg [7:0]data_in_1;
	output reg valid_in_0;
	output reg valid_in_1;
	output reg clk;
	output reg reset_L;
	input wire valid_out;
	input wire [7:0]data_out; 

	initial clk<=0;	

	always #2 clk <= ~clk;

	initial begin
		repeat (1) begin
		@(posedge clk);
			data_in_0<=8'b0;
			data_in_1<=8'b0;
			valid_in_0<=0;
			valid_in_0<=0;
			reset_L<=0;
		end
        repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hAA;
			data_in_1<=8'hBB;
			valid_in_0<=0;
			valid_in_1<=0;
			reset_L<=1;
		end
		 repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hAC;
			data_in_1<=8'hBC;
			valid_in_0<=1;
			valid_in_1<=0;
			reset_L<=1;
		end
		repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hFF;
			data_in_1<=8'hDC;
			valid_in_0<=1;
			valid_in_1<=1;
			reset_L<=1;
		end
		repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hEE;
			data_in_1<=8'h00;
			valid_in_0<=1;
			valid_in_1<=1;
			reset_L<=1;
		end
		repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hDD;
			data_in_1<=8'h01;
			valid_in_0<=1;
			valid_in_1<=1;
			reset_L<=1;
		end
		repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hCC;
			data_in_1<=8'h02;
			valid_in_0<=0;
			valid_in_1<=0;
			reset_L<=1;
		end
		repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hCD;
			data_in_1<=8'hEF;
			valid_in_0<=0;
			valid_in_1<=0;
			reset_L<=1;
        end
        repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hFE;
			data_in_1<=8'hDC;
			valid_in_0<=0;
			valid_in_1<=1;
			reset_L<=1;
        end
        repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hBD;
			data_in_1<=8'h03;
			valid_in_0<=1;
			valid_in_1<=1;
			reset_L<=1;
        end
        repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hBB;
			data_in_1<=8'h04;
			valid_in_0<=0;
			valid_in_1<=0;
			reset_L<=1;
        end
        repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hEF;
			data_in_1<=8'h24;
			valid_in_0<=0;
			valid_in_1<=0;
			reset_L<=1;
        end
        repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hCE;
			data_in_1<=8'h33;
			valid_in_0<=1;
			valid_in_1<=1;
			reset_L<=1;
        end 
        repeat (1) begin
            data_in_0<=8'hAA;
			data_in_1<=8'h05;
			valid_in_0<=1;
			valid_in_1<=1;
			reset_L<=1;
        end
        repeat (1) begin
        @(posedge clk);
			data_in_0<=8'h09;
			data_in_1<=8'h06;
			valid_in_0<=0;
			valid_in_1<=0;
			reset_L<=1;
        end
        repeat (1) begin
        @(posedge clk);
			data_in_0<=8'hBF;
			data_in_1<=8'h43;
			valid_in_0<=0;
			valid_in_1<=0;
			reset_L<=1;
        end
        repeat (1) begin
		@(posedge clk);
			data_in_0<=8'hCA;
			data_in_1<=8'h56;
			valid_in_0<=1;
			valid_in_1<=1;
			reset_L<=1;
        end 
        repeat (1) begin
            data_in_0<=8'h88;
			data_in_1<=8'h07;
			valid_in_0<=1;
			valid_in_1<=1;
			reset_L<=1;
        end
        repeat (1) begin
        @(posedge clk);
			data_in_0<=8'h77;
			data_in_1<=8'h08;
			valid_in_0<=0;
			valid_in_1<=0;
			reset_L<=1;
        end
        repeat (1) begin
        @(posedge clk);
			data_in_0<=8'b0;
			data_in_1<=8'b0;
			valid_in_0<=0;
			valid_in_1<=0;
			reset_L<=1;
        end
        repeat (1) begin
            data_in_0<=8'b0;
			data_in_1<=8'b0;
			valid_in_0<=0;
			valid_in_1<=0;
			reset_L<=0;
        end
		#60 $finish;
	end
endmodule 

