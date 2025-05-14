module full_adder (
                    input a,
                    input b,
                    input c,
                    output cout,
                    output sum
);
    assign sum = a^b^c;
    assign cout= (a&b) | (a&c) | (b&c);
endmodule