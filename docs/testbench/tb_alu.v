`timescale 1ns / 1ps

module tb_alu();

reg [7:0]A;
reg [7:0]B;
reg [3:0]alu_op;
wire [7:0] result;
wire zero;

alu uut(A,B,alu_op,result,zero);

initial begin 

$monitor("time=%0t | op=%b | A=%d | B=%d | result=%d | zero=%b",
         $time, alu_op, A, B, result, zero);


 // unused opcodes
    A = 8'b0001_0010; B = 8'b0011_0100; alu_op = 4'b0000; #10;  // 0000_0000 zero=1
    A = 8'b0001_0010; B = 8'b0011_0100; alu_op = 4'b1111; #10;  // 0000_0000 zero=1
   // ADD
    A = 8'b0001_1001; B = 8'b0001_0001; alu_op = 4'b0001; #10;  // 0010_1010
    A = 8'b1111_1111; B = 8'b0000_0001; alu_op = 4'b0001; #10;  // 0000_0000 zero=1
    // SUB
    A = 8'b0000_0101; B = 8'b0000_0101; alu_op = 4'b0010; #10;  // 0000_0000 zero=1
    A = 8'b0000_0011; B = 8'b0000_0101; alu_op = 4'b0010; #10;  // 1111_1110
    // AND
    A = 8'b1111_0000; B = 8'b0011_1100; alu_op = 4'b0011; #10;  // 0011_0000
    // OR
    A = 8'b1111_0000; B = 8'b0000_1111; alu_op = 4'b0100; #10;  // 1111_1111
    // XOR
    A = 8'b1010_1010; B = 8'b1010_1010; alu_op = 4'b0101; #10;  // 0000_0000 zero=1
    // NOT
    A = 8'b0000_1111; B = 8'b0000_0000; alu_op = 4'b0110; #10;  // 1111_0000
    // INC
    A = 8'b1111_1111; B = 8'b0000_0000; alu_op = 4'b0111; #10;  // 0000_0000 zero=1
    // DEC
    A = 8'b0000_0000; B = 8'b0000_0000; alu_op = 4'b1000; #10;  // 1111_1111
    // PASS_A
    A = 8'b0101_1010; B = 8'b1010_0101; alu_op = 4'b1001; #10;  // 0101_1010
    // PASS_B
    A = 8'b0101_1010; B = 8'b1010_0101; alu_op = 4'b1010; #10;  // 1010_0101
   $finish;
end

endmodule
