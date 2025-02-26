

module sample_circuit (input A, B, C, output D, E);
    wire w1;

    and G1(w1, A, B);
    not G2(E, C);
    or G3(D, w1, E);
endmodule

