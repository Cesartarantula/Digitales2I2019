`timescale 1ns/100ps
module mux (
            input            clk,
            input            reset_L,
            input [7:0]      data_in_0,
            input [7:0]      data_in_1,
            input            valid_in_0,
            input            valid_in_1,
            output reg valid_out,
            output reg [7:0] data_out
            );

         reg selector;
         reg v_activo_0;
         reg v_activo_1;
            
   always @ (posedge clk) begin
        if (!reset_L) begin
            data_out <= 0;
            valid_out <= 0;
            selector <= 0;
        end 
        else begin
            if (valid_in_0 && valid_in_1 && ~v_activo_0 && ~v_activo_1) begin
                selector <= ~selector;
                v_activo_1 <= selector;
                v_activo_0 <= ~selector;
            end
            else begin
                if (valid_in_0 && ~v_activo_1) begin
                    v_activo_0 <= 1;
                end else begin
                    v_activo_0 <= 0;
                end 
                if (valid_in_1 && ~v_activo_0) begin
                    v_activo_1 <= 1;
                end else begin
                    v_activo_1 <= 0;
                end 
            end
            
            valid_out = v_activo_0 || v_activo_1;
            
            if (v_activo_0) begin
                data_out <= data_in_0;
            end else if (v_activo_1) begin
                data_out <= data_in_1;
                end else begin
                data_out <= 0;
                end
        end
    end
endmodule
