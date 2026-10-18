`timescale 1ns / 1ps

module program_counter(
  input clk,rst,inc,load,
  input [7:0] load_ad,
  output reg [7:0] pc_out
);
    
always@(posedge clk)begin
     if(rst)begin
       pc_out <= 8'b0;     
     end else begin
        if(load)begin
           pc_out<= load_ad;
        end else begin
           pc_out<= inc?(pc_out+1'b1):pc_out;
        end
     end

end       
endmodule
