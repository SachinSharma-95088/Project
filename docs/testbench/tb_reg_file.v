`timescale 1ns / 1ps

module tb_reg_file();

reg clk,rst,we;
reg [1:0] wsel;
reg [1:0] rsel;
reg [7:0] wdata;

wire [7:0] a_out;
wire [7:0] r_out;

register_file uut1(clk,rst,we,wsel,rsel,wdata,a_out,r_out);

always #5 clk=~clk;

initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;
    we = 0;
    wsel = 2'b00;
    rsel = 2'b00;
    wdata = 8'b0;
    
     $monitor("Time=%0t | rst=%b we=%b wsel=%b wdata=%d rsel=%b a_out=%d r_out=%d",
             $time, rst, we, wsel, wdata, rsel, a_out, r_out);
             
   
     // Test 1: Reset
    #10;
    rst = 0;
    #1;
    if (a_out == 8'd0 && r_out == 8'd0)
        $display("PASS: Reset");
    else
        $display("FAIL: Reset");

    // Test 2: Write 25 to A
    @(negedge clk);
    we = 1;
    wsel = 2'b00;
    wdata = 8'd25;
    @(posedge clk);
    #1;
    if (a_out == 8'd25 && r_out == 8'd25)
        $display("PASS: Write and read A");
    else
        $display("FAIL: Write and read A");

    // Test 3: Write 40 to B
    @(negedge clk);
    wsel = 2'b01;
    wdata = 8'd40;
    @(posedge clk);
    #1;
    rsel = 2'b01;
    #1;
    if (r_out == 8'd40)
        $display("PASS: Write and read B");
    else
        $display("FAIL: Write and read B");

    // Test 4: Write 60 to C
    @(negedge clk);
    wsel = 2'b10;
    wdata = 8'd60;
    @(posedge clk);
    #1;
    rsel = 2'b10;
    #1;
    if (r_out == 8'd60)
        $display("PASS: Write and read C");
    else
        $display("FAIL: Write and read C");

    // Test 5: Verify A retains its value
    rsel = 2'b00;
    #1;
    if (r_out == 8'd25 && a_out == 8'd25)
        $display("PASS: A retains its value");
    else
        $display("FAIL: A retains its value");

    // Test 6: Write disabled
    @(negedge clk);
    we = 0;
    wsel = 2'b00;
    wdata = 8'd99;
    @(posedge clk);
    #1;
    if (a_out == 8'd25)
        $display("PASS: Write disabled");
    else
        $display("FAIL: Write disabled");

    // Test 7: Invalid read selection
    rsel = 2'b11;
    #1;
    if (r_out == 8'd0)
        $display("PASS: Invalid read selection");
    else
        $display("FAIL: Invalid read selection");

    $display("Register file testing complete.");
    $finish;
end 
endmodule
