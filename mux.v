module mux (
	input	i0, i1, i2, i3,
	input	s0, s1,
	output reg	d
);

always  @(*) begin
	case ( {s0, s1} )
		2'b00 : d = i0;
		2'b01 : d = i1;
		2'b10 : d = i2;
		2'b11 : d = i3;
	endcase
end

endmodule
