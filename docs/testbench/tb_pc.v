`timescale 1ns / 1ps
module tb_pc();

reg clk,rst,inc,load;
reg [7:0]load_ad;
wire [7:0]pc_out;

program_counter uut2(clk,rst,inc,load,load_ad,pc_out);

always #5 clk=~clk;

initial begin 
  // Initialize inputs
    clk = 0;
    rst = 1;
    inc=0;
    load=0;
    load_ad=8'b0;
    
    $monitor("Time=%0t | rst=%b inc=%b load=%b load_ad=%d pc_out=%d",
             $time, rst, inc, load, load_ad, pc_out);
             
   #10;
    rst = 0;
    #1;
    if ( pc_out == 8'd0)
        $display("PASS: Reset");
    else
        $display("FAIL: Reset");

 // Test 2: increment
    @(negedge clk);
    load = 0;
    inc=1;
    @(posedge clk);
    #1;
    if (pc_out == 8'd1)
        $display("PASS:Increment Sucessfull");
    else
        $display("FAIL: Wrong Increment");

    // Test 3: Hold
    @(negedge clk);
    inc = 0;
    load = 0;

   @(posedge clk);
   #1;
   if (pc_out == 8'd1)
      $display("PASS: Hold");
   else
      $display("FAIL: Hold");


     // Test 4: Load address
      @(negedge clk);
      load = 1;
      load_ad = 8'd20;

      @(posedge clk);
      #1;
      if (pc_out == 8'd20)
         $display("PASS: Load address");
     else
          $display("FAIL: Load address");
          
          // Test 5: Increment after load
     @(negedge clk);
   load = 0;
   inc = 1;
   @(posedge clk);
   #1;
    if (pc_out == 8'd21)
       $display("PASS: Increment after load");
    else
        $display("FAIL: Increment after load");
      // Test 6: Reset priority
     @(negedge clk);
     rst = 1;
     load = 1;
     load_ad = 8'd50;
     inc = 1;
     @(posedge clk);
     #1;
     if (pc_out == 8'd0)
        $display("PASS: Reset priority");
     else
         $display("FAIL: Reset priority");
        $finish;
end
endmodule
