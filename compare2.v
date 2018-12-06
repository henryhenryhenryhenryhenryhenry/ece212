// Compare two 2 bit numbers (structural verilog style)

module compare2 (GT, EQ, LT, x, y);
	input x, y;
	output GT, EQ, LT;
wire GT, EQ, LT;
	wire [1:0] x, y;
    wire nd1, nd2, nd3, nd4, nd5, nd6, nd7, nd8, nd9, nd10;
    wire x1, x0, y1, y0;

    // Structural verilog style.

    and u1(nd1, x1, ~y1);
    and u2 (nd2, ~y1, x0, ~y0);
    and u3 (nd3, x1, x0, ~y0);
    or u4 (GT, nd1, nd2, nd3);
    and u5 (nd4, ~x1, ~y1, ~x0, ~y0);
    and u6 (nd5, ~x1, ~y1, x0, y0);
    and u7 (nd6, x1, y1, ~x0, ~y0);
    and u8 (nd7, x1, y1, x0, y0);
    or u9 (EQ, nd4, nd5, nd6, nd7);
    and u10 (nd8, ~x1, y1);
    and u11 (nd9, ~x1, ~x0, y0);
    and u12 (nd10, y1, ~x0, y0);
    or u13 (LT, nd8, nd9, nd10);

assign x1 = x[1];
assign x0 = x[0];
assign y1 = y[1];
assign y0 = y[0];
endmodule