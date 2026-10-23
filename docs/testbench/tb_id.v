`timescale 1ns / 1ps

module tb_id();

    reg  [7:0] instruction;
    wire [3:0] opcode;
    wire [3:0] operand;

    instruction_decoder uut8 (instruction,opcode,operand );

    initial begin
        $monitor("Time=%0t | Instruction=%h | Opcode=%h | Operand=%h",
                 $time, instruction, opcode, operand);

        // Test 1: ADD, operand 2
        instruction = 8'h42;
        #10;
        if (opcode === 4'h4 && operand === 4'h2)
            $display("PASS: ADD, operand 2");
        else
            $display("FAIL: ADD, operand 2");

        // Test 2: MVI, operand field 5
        instruction = 8'h05;
        #10;
        if (opcode === 4'h0 && operand === 4'h5)
            $display("PASS: MVI opcode extraction");
        else
            $display("FAIL: MVI opcode extraction");

        // Test 3: JNZ, operand field A
        instruction = 8'hCA;
        #10;
        if (opcode === 4'hC && operand === 4'hA)
            $display("PASS: JNZ opcode extraction");
        else
            $display("FAIL: JNZ opcode extraction");

        // Test 4: NOP
        instruction = 8'hE0;
        #10;
        if (opcode === 4'hE && operand === 4'h0)
            $display("PASS: NOP opcode extraction");
        else
            $display("FAIL: NOP opcode extraction");

        // Test 5: HLT
        instruction = 8'hF0;
        #10;
        if (opcode === 4'hF && operand === 4'h0)
            $display("PASS: HLT opcode extraction");
        else
            $display("FAIL: HLT opcode extraction");

        $display("Instruction Decoder testing complete.");
        $finish;
    end

endmodule
