module mac_unit(
                         input [7:0] a,
                         input [7:0] b,
                         input [31:0] s_fb,
                         input [31:0] c_fb,
                         output [31:0] c,
                         output [31:0] s
);

    wire [15:0] mul_s;
    wire [32:0] csa_c;
    wire [31:0] csa_s;

    mul mul_inst (
             .A(a),
             .B(b),
             .prod(mul_s)
    );

    csa #(.WIDTH(32)) csa (
                            .a(s_fb),
                            .b({{16{mul_s[15]}}, mul_s}),
                            .c(c_fb),
                            .c_out(csa_c),
                            .s(csa_s)
    );

    assign c = csa_c[31:0];
    assign s = csa_s[31:0];
endmodule