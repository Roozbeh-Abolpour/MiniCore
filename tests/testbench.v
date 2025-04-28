`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Roozbeh Abolpour
// 
// Create Date: 2025
// Design Name: Testbench for Main CPU
// Module Name: testbench
// Project Name: Verilog CPU
//////////////////////////////////////////////////////////////////////////////////

module testbench;

    // Inputs
    reg clk;
    reg rst;

    // Instantiate the Unit Under Test (UUT)
    Main uut (
        .clk(clk), 
        .rst(rst)
    );

    // Clock generation: Toggle every 5ns => 10ns clock period => 100MHz clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Initial reset
        rst = 1;
        #20;   // Hold reset for 20 ns
        rst = 0;

        // Run simulation for some time
        #1000;

        // Finish simulation
        $finish;
    end

endmodule
