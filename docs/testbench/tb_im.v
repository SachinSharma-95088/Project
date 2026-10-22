`timescale 1ns/1ps

module tb_im();

    reg  [7:0] address;
    wire [7:0] instruction;

    instruction_memory uut6(address,instruction );

    initial begin
        $monitor("Time=%0t | Address=%0d | Instruction=0x%02h",
                 $time, address, instruction);

        // Test address 0
        address = 8'd0; #10;
        if (instruction === 8'h10)
            $display("PASS: Address 0");
        else
            $display("FAIL: Address 0, got %h", instruction);

        // Test address 1
        address = 8'd1; #10;
        if (instruction === 8'h20)
            $display("PASS: Address 1");
        else
            $display("FAIL: Address 1, got %h", instruction);

        // Test address 2
        address = 8'd2; #10;
        if (instruction === 8'h30)
            $display("PASS: Address 2");
        else
            $display("FAIL: Address 2, got %h", instruction);

        // Test address 3
        address = 8'd3; #10;
        if (instruction === 8'h40)
            $display("PASS: Address 3");
        else
            $display("FAIL: Address 3, got %h", instruction);

        // Test address 4
        address = 8'd4; #10;
        if (instruction === 8'h50)
            $display("PASS: Address 4");
        else
            $display("FAIL: Address 4, got %h", instruction);

        $display("Instruction Memory testing complete.");
        $finish;
    end

endmodule
