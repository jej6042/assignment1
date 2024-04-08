`timescale 1ns/1ps
module tb_decoder;

reg [1:0] i;
wire [3:0] d;

decoder instance_decoder(
		.i(i),
		.d(d)
);

initial begin
	i = 2'b00; #10;
	i = 2'b01; #10;
	i = 2'b10; #10;
	i = 2'b11; #10;

	$finish;
end

initial begin
    $monitor("시간 = %t, i = %b, d = %b", $time, i, d);
end
endmodule