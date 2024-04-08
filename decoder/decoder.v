module decoder (
	input [1:0] i,
	output reg [3:0] d
);
	
always @(*) begin
case(i)
	2'b00: d = 4'b0001;
	2'b01: d = 4'b0010;
	2'b10: d = 4'b0100;
	2'b11: d = 4'b1000;
endcase
end

endmodule
