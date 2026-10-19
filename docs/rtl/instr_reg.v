`timescale 1ns / 1ps

module instr_reg(
  input clk,rst,load,
  input [7:0]data_in,
  output reg [7:0]ir_out
);
    
    always@(posedge clk)begin
         if(rst)begin
            ir_out <=8'b0;
         end else begin
               ir_out<=load? data_in : ir_out;
         end
    end
endmodule
