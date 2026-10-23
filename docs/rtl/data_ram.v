`timescale 1ns / 1ps

module data_ram(
    input wire clk, we,
    input wire [7:0] address,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

    reg [7:0] mem [0:255];

    // Synchronous write
    always @(posedge clk) begin
        if (we) begin
            mem[address] <= data_in;
        end
    end

    // Combinational read
    always @(*) begin
        data_out = mem[address];
    end

endmodule
