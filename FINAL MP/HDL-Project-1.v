`timescale 1ns / 1ps

module HDL_1_dataflow (F,A,B,C,D);
    input A,B,C,D;
    input w1,w2,w3,w4,w5,w6,w7,w8,w9;
    output F;

    assign w1 = ~A&~B&~C&~D;    //0
    assign w2 = ~A&~B&~C&D;     //1
    assign w3 = A&~B&~C&~D;     //8
    assign w4 = A&~B&~C&D;      //9
    assign w5 = A&~B&C&~D;      //10
    assign w6 = A&~B&C&D;       //11
    assign w7 = A&B&~C&~D;      //12 
    assign w8 = A&B&C&~D;       //14  
    assign w9 = A&B&C&D;        //15

    assign F = w1 | w2 | w3 | w4 | w5 | w6 | w7 | w8 | w9;
endmodule 