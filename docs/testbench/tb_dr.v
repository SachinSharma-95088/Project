`timescale 1ns / 1ps

module tb_dr();

    reg clk, we;
    reg [7:0] address, data_in;
    wire [7:0] data_out;

    data_ram uut7 (clk,we,address,data_in,data_out);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        we = 0;
        address = 0;
        data_in = 0;

        // Test 1: Write A5 to address 10
        @(negedge clk);
        address = 8'd10;
        data_in = 8'hA5;
        we = 1;

        @(posedge clk);
        #1;
        if (data_out === 8'hA5)
            $display("PASS: Write and read A5");
        else
            $display("FAIL: Expected A5, got %h", data_out);

        // Test 2: Write 3C to address 20
        @(negedge clk);
        address = 8'd20;
        data_in = 8'h3C;
        we = 1;

        @(posedge clk);
        #1;
        if (data_out === 8'h3C)
            $display("PASS: Write and read 3C");
        else
            $display("FAIL: Expected 3C, got %h", data_out);

        // Test 3: Disable write and verify stored data remains
        @(negedge clk);
        we = 0;
        data_in = 8'hFF;
        address = 8'd20;
        #1;

        if (data_out === 8'h3C)
            $display("PASS: Data retained when write disabled");
        else
            $display("FAIL: Data changed, got %h", data_out);

        // Test 4: Verify address 10 retained its value
        address = 8'd10;
        #1;

        if (data_out === 8'hA5)
            $display("PASS: Address 10 retained A5");
        else
            $display("FAIL: Expected A5, got %h", data_out);

        $display("Data RAM testing complete.");
        $finish;
    end

endmodule
