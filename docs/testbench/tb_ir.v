
`timescale 1ns / 1ps

module tb_ir();

reg clk, rst, load;
reg [7:0] data_in;
wire [7:0] ir_out;

instr_reg uut3(clk, rst, load, data_in, ir_out);

always #5 clk = ~clk;

initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;
    load = 0;
    data_in = 8'b0;

    $monitor("Time=%0t | rst=%b | load=%b | data_in=%h | ir_out=%h",
             $time, rst, load, data_in, ir_out);

    // Test 1: Reset
    #10;
    rst = 0;
    #1;
    if (ir_out == 8'h00)
        $display("PASS: Reset");
    else
        $display("FAIL: Reset");

    // Test 2: Load instruction 0x35
    @(negedge clk);
    load = 1;
    data_in = 8'h35;

    @(posedge clk);
    #1;
    if (ir_out == 8'h35)
        $display("PASS: Load");
    else
        $display("FAIL: Load");

    // Test 3: Hold
    @(negedge clk);
    load = 0;

    @(posedge clk);
    #1;
    if (ir_out == 8'h35)
        $display("PASS: Hold");
    else
        $display("FAIL: Hold");

    // Test 4: Load another instruction
    @(negedge clk);
    load = 1;
    data_in = 8'hA6;

    @(posedge clk);
    #1;
    if (ir_out == 8'hA6)
        $display("PASS: Load another instruction");
    else
        $display("FAIL: Load another instruction");

    // Test 5: Reset priority over load
    @(negedge clk);
    rst = 1;
    load = 1;
    data_in = 8'hFF;

    @(posedge clk);
    #1;
    if (ir_out == 8'h00)
        $display("PASS: Reset priority");
    else
        $display("FAIL: Reset priority");

    $display("Instruction Register testing complete.");
    $finish;
end

endmodule
