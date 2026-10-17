`timescale 1ns / 1ps

module register_file(
    input clk,rst,we,
    input [1:0] wsel,
    input [1:0] rsel,
    input [7:0] wdata,

    output reg [7:0] a_out,
    output reg [7:0] r_out
);

reg [7:0] A;
reg [7:0] B;
reg [7:0] C;

localparam SEL_A = 2'b00;
localparam SEL_B = 2'b01;
localparam SEL_C = 2'b10;


always @(posedge clk) begin // Write logic
    if (rst) begin
        A <= 8'b0; B <= 8'b0; C <= 8'b0;
    end
    else if (we) begin
        case (wsel)
            SEL_A: A <= wdata;
            SEL_B: B <= wdata;
            SEL_C: C <= wdata;
            default: ;
        endcase
    end
end


always @(*) begin // Read logic
    a_out = A;

    case (rsel)
        SEL_A:   r_out = A;
        SEL_B:   r_out = B;
        SEL_C:   r_out = C;
        default: r_out = 8'b0;
    endcase
end

endmodule
