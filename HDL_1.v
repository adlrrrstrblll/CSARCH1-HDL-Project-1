module HDL_1 (input A, B, C, D, output F);
    wire AC, BC, CC, DC; 
    wire w1, w2, w3, w4, w5, w6, w7, w8, w9;

    // Generate Complements
    not G1(AC, A);
    not G2(BC, B);
    not G3(CC, C);
    not G4(DC, D);

    // Minterm Implementation (Fixed AND Gates)
    and G5(w1, AC, BC, CC, DC); // 0
    and G6(w2, AC, BC, CC, D);  // 1
    and G7(w3, A, BC, CC, DC);  // 8
    and G8(w4, A, BC, CC, D);   // 9
    and G9(w5, A, BC, C, D);    // 10
    and G10(w6, A, BC, C, DC);  // 11
    and G11(w7, A, B, CC, DC);  // 12
    and G12(w8, A, B, C, DC);   // 14
    and G13(w9, A, B, C, D);    // 15

    // OR Gate to Sum Minterms
    or G14(F, w1, w2, w3, w4, w5, w6, w7, w8, w9);
endmodule

