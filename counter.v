module counter(
    input clk, 
    input rst_n,
    output [3:0] cnt
);

    reg [3:0] r_cnt;
    
always @(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		r_cnt <= 4'b0000;
	else
		r_cnt <= cnt+1;
end

assign cnt = r_cnt;

endmodule

`timescale 1ns/1ps

module counter_tb;

reg clk;
reg rst_n;
wire [3:0] cnt;

counter instance_counter (
	.clk(clk),
	.rst_n(rst_n),
	.cnt(cnt)
);

initial begin
	clk = 0;
	rst_n = 1;
	#10
	rst_n = 0;
	#10
	rst_n = 1;
	#100
	
	$finish;
end

always 
	#5
	clk = ~clk;
	
initial begin
	$monitor("시간=%t, 출력=%d", $time, cnt);
end

endmodule
	