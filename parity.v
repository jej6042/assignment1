module parity (
    input a,
    input b,
    input c,
    output P
);

    assign P = (~a&~b&c) | (~a&b&~c) | (a&~b&~c) | (a&b&c);

endmodule

`timescale 1ns / 1ps
module parity_tb;

reg a;
reg b;
reg c;
wire P;

parity instance_parity (
	.a(a),
	.b(b),
	.c(c),
	.P(P)
);

initial begin
	a=0;b=0;c=0;
	#10
	a=0;b=0;c=1;
	#10
	a=0;b=1;c=0;
	#10
	a=0;b=1;c=1;
	#10
	a=1;b=0;c=0;
	#10
	a=1;b=0;c=1;
	#10
	a=1;b=1;c=0;
	#10
	a=1;b=1;c=1;
	#10

	$finish;
end

initial begin
	$monitor("시간=%t, 입력 a=%b, 입력 b=%b, 입력 c=%b, 출력 P=%b", $time, a, b, c, P);
end

endmodule