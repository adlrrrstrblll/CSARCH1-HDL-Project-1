// Francesca Anne Denise C. Catolico - CSARCH1 XX22
// Testbench for OddUpDownCounter

`timescale 1ns/1ns
module OddUpDownCounter_tb;
    reg clk, reset, Y;
    wire [3:0] out;
    
    // Instantiate the counter
    OddUpDownCounter uut(.clk(clk), .reset(reset), .Y(Y), .out(out));
    
    // Clock generation (5 time units half cycle)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test cases
    initial begin
        // Initial reset
        reset = 0; Y = 0;
        #10 reset = 1; // Release reset after 10ns
        
        // Test downstream (Y=0)
        Y = 0;
        #100; // Allow time to see transitions
        
        // Test upstream (Y=1)
        Y = 1;
        #100;
        
        $finish;
    end
    
    // Monitor signals
    initial begin
        $monitor("Time=%t, clk=%b, reset=%b, Y=%b, out=%b, Decimal: %d", 
                 $time, clk, reset, Y, out, out);
    end
    
    // Generate waveform file
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, OddUpDownCounter_tb);
    end
endmodule