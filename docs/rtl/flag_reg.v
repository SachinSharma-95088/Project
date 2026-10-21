`timescale 1ns / 1ps
module flag_reg(
  input clk,rst,we,z_in,c_in,n_in,
  output reg z_flag,c_flag,n_flag
    );
    
always @(posedge clk) begin 
    if (rst) begin
        z_flag <= 1'b0; c_flag <= 1'b0; n_flag <= 1'b0;
    end
    else if (we) begin
        z_flag<= z_in;
        c_flag<= c_in;
        n_flag<= n_in;
    end
end
endmodule
