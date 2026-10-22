`timescale 1ns / 1ps

module instruction_memory(
    input wire [7:0] address,
    output reg [7:0] instruction
);

 reg [7:0] mem [0:255];

    // Initialize memory just for tb simulation
    initial begin
        mem[0] = 8'h10;
        mem[1] = 8'h20;
        mem[2] = 8'h30;
        mem[3] = 8'h40;
        mem[4] = 8'h50;
    end

    // Combinational read
    always @(*) begin
        instruction = mem[address];
    end

endmodule
