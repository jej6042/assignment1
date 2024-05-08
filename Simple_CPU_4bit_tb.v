`timescale 1ns / 1ps

module Simple_CPU_4bit_tb;


reg clk = 0;         
reg reset = 0;       
reg [3:0] memory_address = 0; 
wire [3:0] data_out; 

Simple_CPU_4bit cpu (
    .clk(clk),
    .reset(reset),
    .memory_address(memory_address),
    .data_out(data_out)
);


initial begin
    clk = 0;
    reset = 1;
    #20;
    reset = 0;

    memory_address = 2;
    #10;
    memory_address = 3;
    #10;
    memory_address = 2;
    
    #10;
    $finish;
end

always begin
    #3
    clk = ~clk;
end

// Monitor CPU values
always@(posedge clk) begin
    $display("Time=%t, PC=%h, Instruction=%h, Operand=%h, Data Out=%h", $time, cpu.PC, cpu.instruction, cpu.operand, data_out);
end

endmodule