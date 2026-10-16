`timescale 1ns / 1ps

module alu(
    input [7:0]A,
    input [7:0]B,
    input [3:0]alu_op,
    output reg [7:0] result,
    output zero
    );
    
parameter ADD    = 4'b0001;
parameter SUB    = 4'b0010;
parameter AND_OP = 4'b0011;
parameter OR_OP  = 4'b0100;
parameter XOR_OP = 4'b0101;
parameter NOT_OP = 4'b0110;
parameter INC    = 4'b0111;
parameter DEC    = 4'b1000;
parameter PASS_A = 4'b1001;
parameter PASS_B = 4'b1010;

assign zero=(result==8'b0)? 1'b1 : 1'b0;     
 always@(*)begin
 
  
    case(alu_op)
    
     ADD   :  result =A+B;
     SUB   :  result =A-B;
    AND_OP :  result =A&B;
     OR_OP :  result =A|B;
    XOR_OP :  result =A^B;
    NOT_OP :  result =~A;
     INC   :  result =A+ 1'b1;
     DEC   :  result =A - 1'b1;
    PASS_A :  result =A;
    PASS_B :  result =B;
   default :  result = 8'b0000_0000;
   endcase
 end

endmodule
