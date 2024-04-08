`timescale 1ns/1ps
module tb_mux;
	
	wire d;
	reg i0, i1, i2, i3;
	reg s0, s1;

mux instance_mux (
	.i0(i0),
	.i1(i1),
	.i2(i2),
	.i3(i3),
	.s0(s0),
	.s1(s1),
	.d(d)
);

initial begin
	i0 = 1'b0;
	i1 = 1'b1;
	i2 = 1'b0;
	i3 = 1'b1;
	#50
   	i0 = 1'b0;
	i1 = 1'b1;
	i2 = 1'b1;
	i3 = 1'b0;
end

initial begin
	s0 = 1'b0;
	s1 = 1'b0;
	#25
	s0 = 1'b0;
	s1 = 1'b1;
	#25
	s0 = 1'b1;
	s1 = 1'b0;
	#25
	s0 = 1'b1;
	s1 = 1'b1;
	#25
	$finish;
end

initial begin
    $monitor("시간=%t, i0 = %b, i1 = %b, i2 = %b, i3 = %b, s0 = %b, s1 = %b, d = %b ", $time,i0,i1,i2,i3,s0,s1,d);
end
    
endmodule
