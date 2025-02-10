`timescale 1ns / 1ps

module sample_circuit_tb();
    reg t_A, t_B, t_C; // reg..input
    wire t_D, t_E;      // wire..output

    sample_circuit dut(t_A, t_B, t_C, t_D, t_E);

    initial begin

        t_A = 0;
        t_B = 0; 
        t_C = 0;

        #10 t_A = 0; t_B = 0; t_C = 1;
        #10 t_A = 0; t_B = 1; t_C = 0;
        #10 t_A = 0; t_B = 1; t_C = 1;
        #10 t_A = 1; t_B = 0; t_C = 0;
        #10 t_A = 1; t_B = 0; t_C = 1;
        #10 t_A = 1; t_B = 1; t_C = 0;
        #10 t_A = 1; t_B = 1; t_C = 1;
    end

    // Monitor block to observe outputs
    initial begin
        $monitor("time = %0d, A = %b, B = %b, C = %b, D = %b, E = %b", $time, t_A, t_B, t_C, t_D, t_E);
        $dumpfile("sample_circuit.vcd");  // Output file for waveform
        $dumpvars(0, sample_circuit_tb);  // Dump all signals for waveform analysis
    end
endmodule
