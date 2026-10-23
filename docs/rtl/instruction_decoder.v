`timescale 1ns / 1ps

module instruction_decoder(
    input  wire [7:0] instruction,
    output wire [3:0] opcode,
    output wire [3:0] operand
);

    assign opcode  = instruction[7:4];
    assign operand = instruction[3:0];

endmodule
