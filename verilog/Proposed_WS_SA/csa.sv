module csa #(parameter WIDTH = 4) 
(
            input signed [WIDTH-1:0] a,
            input signed [WIDTH-1:0] b,
            input signed [WIDTH-1:0] c,
            output signed [WIDTH:0] c_out,
            output signed [WIDTH-1:0] s
);
    genvar i;
    generate
        for(i=0;i<WIDTH;i=i+1)
        begin:gen
            full_adder FA(
                        .a(a[i]),
                        .b(b[i]),
                        .c(c[i]),
                        .cout(c_out[i+1]),
                        .sum(s[i])
                    );
        end
    endgenerate

    assign c_out[0] = 1'b0;
endmodule