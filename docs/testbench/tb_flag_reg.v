
`timescale 1ns / 1ps

module tb_flag_reg();

reg clk, rst, we, z_in, c_in, n_in;
wire z_flag, c_flag, n_flag;

flag_reg uut5(clk,rst,we,z_in,c_in,n_in,z_flag,c_flag,n_flag);

always #5 clk = ~clk;

initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;
    we = 0;
    z_in = 0;
    c_in = 0;
    n_in = 0;

    $monitor("Time=%0t | rst=%b we=%b | z_in=%b c_in=%b n_in=%b | z_flag=%b c_flag=%b n_flag=%b",
             $time, rst, we, z_in, c_in, n_in, z_flag, c_flag, n_flag);

    // Test 1: Reset
    #10;
    rst = 0;
    #1;
    if (z_flag == 0 && c_flag == 0 && n_flag == 0)
        $display("PASS: Reset");
    else
        $display("FAIL: Reset");

    // Test 2: Write Z=1, C=0, N=1
    @(negedge clk);
    we = 1;
    z_in = 1;
    c_in = 0;
    n_in = 1;

    @(posedge clk);
    #1;
    if (z_flag == 1 && c_flag == 0 && n_flag == 1)
        $display("PASS: Write flags 101");
    else
        $display("FAIL: Write flags 101");

    // Test 3: Hold previous values
    @(negedge clk);
    we = 0;
    z_in = 0;
    c_in = 1;
    n_in = 0;

    @(posedge clk);
    #1;
    if (z_flag == 1 && c_flag == 0 && n_flag == 1)
        $display("PASS: Hold flags");
    else
        $display("FAIL: Hold flags");

    // Test 4: Write Z=0, C=1, N=0
    @(negedge clk);
    we = 1;
    z_in = 0;
    c_in = 1;
    n_in = 0;

    @(posedge clk);
    #1;
    if (z_flag == 0 && c_flag == 1 && n_flag == 0)
        $display("PASS: Write flags 010");
    else
        $display("FAIL: Write flags 010");

    // Test 5: Reset overrides write
    @(negedge clk);
    rst = 1;
    we = 1;
    z_in = 1;
    c_in = 1;
    n_in = 1;

    @(posedge clk);
    #1;
    if (z_flag == 0 && c_flag == 0 && n_flag == 0)
        $display("PASS: Reset priority");
    else
        $display("FAIL: Reset priority");

    $finish;
end

endmodule
