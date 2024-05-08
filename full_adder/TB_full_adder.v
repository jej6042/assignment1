`timescale 1ns / 1ps

module TB_full_adder();

    reg     A;
    reg     B;
    reg     C_i;
    wire    C_o;
    wire    S_o;

full_adder DUT(
    .A ( A ),
    .B ( B ),
    .C_i ( C_i ),
    .C_o ( C_o ),
    .S_o ( S_o )
    );

initial begin
    #0
    A = 1'b0;
    B = 1'b0;
    C_i = 1'b0;
    
    #10
    A = 1'b1;
    B = 1'b0;
    C_i = 1'b0;
    
    #10
    A = 1'b0;
    B = 1'b1;
    C_i = 1'b1;
    
    #10
    A = 1'b1;
    B = 1'b1;
    C_i = 1'b1;
   
    #50 $finish;

    end
endmodule
