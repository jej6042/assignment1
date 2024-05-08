module full_adder (
    input   A,
    input   B,
    input   C_i,
    output  C_o,
    output  S_o
);

    assign  C_o = (A & B) | (B & C_i) | (A & C_i);
    assign  S_o = A ^ B ^ C_i;
	 
endmodule
