module mul(
    input [7:0] A,
    input [7:0] B,
    output [15:0] prod
);

    wire sign_a, sign_b, sign_result;
    assign sign_a = A[7];
    assign sign_b = B[7];
    assign sign_result = sign_a ^ sign_b;
    
    
    wire [7:0] abs_a, abs_b;
    assign abs_a = sign_a ? (~A + 1'b1) : A;
    assign abs_b = sign_b ? (~B + 1'b1) : B;
    
   
    wire [15:0] unsigned_result;
    
    // Declare internal signals
    wire s00,s01,s02,s03,s04,s05,s06,s07,s10,s11,s12,s13,s14,s15,s16,s17;
    wire s20,s21,s22,s23,s24,s25,s26,s27,s30,s31,s32,s33,s34,s35,s36,s37;
    wire s40,s41,s42,s43,s44,s45,s46,s47,s50,s51,s52,s53,s54,s55,s56,s57;
    wire s60,s61,s62,s63,s64,s65,s66,s67,s70,s71,s72,s73,s74,s75,s76,s77;
    
    wire k01,k02,k03,k04,k05,k06,k07,k08,k09,k10,k11,k12,k13,k14,k15,k16,k17;
    wire k18,k19,k20,k21,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32,k33,k34;
    wire k35,k36,k37,k38,k39,k40,k41,k42,k43,k44,k45,k46,k47,k48,k49,k50,k51;
    wire k52,k53,k54,k55,k56,k57,k58,k59,k60,k61,k62,k63,k64,k65,k66,k67,k68;
    
    wire c01,c02,c03,c04,c05,c06,c07,c08,c09,c10,c11,c12,c13,c14,c15,c16,c17;
    wire c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32,c33,c34;
    wire c35,c36,c37,c38,c39,c40,c41,c42,c43,c44,c45,c46,c47,c48,c49,c50,c51;
    wire c52,c53,c54,c55,c56,c57,c58,c59,c60,c61,c62,c63,c64,c65,c66,c67,c68;

    // Partial products generation with absolute values
    assign s00 = abs_a[0] & abs_b[0];
    assign s10 = abs_a[1] & abs_b[0];
    assign s20 = abs_a[2] & abs_b[0];
    assign s30 = abs_a[3] & abs_b[0];
    assign s40 = abs_a[4] & abs_b[0];
    assign s50 = abs_a[5] & abs_b[0];
    assign s60 = abs_a[6] & abs_b[0];
    assign s70 = abs_a[7] & abs_b[0];
    
    assign s01 = abs_a[0] & abs_b[1];
    assign s11 = abs_a[1] & abs_b[1];
    assign s21 = abs_a[2] & abs_b[1];
    assign s31 = abs_a[3] & abs_b[1];
    assign s41 = abs_a[4] & abs_b[1];
    assign s51 = abs_a[5] & abs_b[1];
    assign s61 = abs_a[6] & abs_b[1];
    assign s71 = abs_a[7] & abs_b[1];
    
    assign s02 = abs_a[0] & abs_b[2];
    assign s12 = abs_a[1] & abs_b[2];
    assign s22 = abs_a[2] & abs_b[2];
    assign s32 = abs_a[3] & abs_b[2];
    assign s42 = abs_a[4] & abs_b[2];
    assign s52 = abs_a[5] & abs_b[2];
    assign s62 = abs_a[6] & abs_b[2];
    assign s72 = abs_a[7] & abs_b[2];
    
    assign s03 = abs_a[0] & abs_b[3];
    assign s13 = abs_a[1] & abs_b[3];
    assign s23 = abs_a[2] & abs_b[3];
    assign s33 = abs_a[3] & abs_b[3];
    assign s43 = abs_a[4] & abs_b[3];
    assign s53 = abs_a[5] & abs_b[3];
    assign s63 = abs_a[6] & abs_b[3];
    assign s73 = abs_a[7] & abs_b[3];
    
    assign s04 = abs_a[0] & abs_b[4];
    assign s14 = abs_a[1] & abs_b[4];
    assign s24 = abs_a[2] & abs_b[4];
    assign s34 = abs_a[3] & abs_b[4];
    assign s44 = abs_a[4] & abs_b[4];
    assign s54 = abs_a[5] & abs_b[4];
    assign s64 = abs_a[6] & abs_b[4];
    assign s74 = abs_a[7] & abs_b[4];
    
    assign s05 = abs_a[0] & abs_b[5];
    assign s15 = abs_a[1] & abs_b[5];
    assign s25 = abs_a[2] & abs_b[5];
    assign s35 = abs_a[3] & abs_b[5];
    assign s45 = abs_a[4] & abs_b[5];
    assign s55 = abs_a[5] & abs_b[5];
    assign s65 = abs_a[6] & abs_b[5];
    assign s75 = abs_a[7] & abs_b[5];
    
    assign s06 = abs_a[0] & abs_b[6];
    assign s16 = abs_a[1] & abs_b[6];
    assign s26 = abs_a[2] & abs_b[6];
    assign s36 = abs_a[3] & abs_b[6];
    assign s46 = abs_a[4] & abs_b[6];
    assign s56 = abs_a[5] & abs_b[6];
    assign s66 = abs_a[6] & abs_b[6];
    assign s76 = abs_a[7] & abs_b[6];
    
    assign s07 = abs_a[0] & abs_b[7];
    assign s17 = abs_a[1] & abs_b[7];
    assign s27 = abs_a[2] & abs_b[7];
    assign s37 = abs_a[3] & abs_b[7];
    assign s47 = abs_a[4] & abs_b[7];
    assign s57 = abs_a[5] & abs_b[7];
    assign s67 = abs_a[6] & abs_b[7];
    assign s77 = abs_a[7] & abs_b[7];

    // Stage zero
    half_adder ha00(.a(s01), .b(s10), .sum(k01), .cout(c01));
    full_adder fa00(.a(s20), .b(s02), .c(s11), .sum(k02), .cout(c02));
    full_adder fa01(.a(s30), .b(s21), .c(s12), .sum(k03), .cout(c03));
    full_adder fa02(.a(s40), .b(s31), .c(s22), .sum(k04), .cout(c04));
    half_adder ha01(.a(s13), .b(s04), .sum(k05), .cout(c05));
    full_adder fa03(.a(s50), .b(s41), .c(s32), .sum(k06), .cout(c06));
    full_adder fa04(.a(s23), .b(s14), .c(s05), .sum(k07), .cout(c07));
    full_adder fa05(.a(s60), .b(s51), .c(s42), .sum(k08), .cout(c08));
    full_adder fa06(.a(s33), .b(s24), .c(s15), .sum(k09), .cout(c09));
    full_adder fa07(.a(s70), .b(s61), .c(s52), .sum(k10), .cout(c10));
    full_adder fa08(.a(s43), .b(s34), .c(s25), .sum(k11), .cout(c11));
    half_adder ha02(.a(s16), .b(s07), .sum(k12), .cout(c12));
    full_adder fa09(.a(s71), .b(s62), .c(s53), .sum(k13), .cout(c13));
    full_adder fa90(.a(s44), .b(s35), .c(s26), .sum(k14), .cout(c14));
    full_adder fa31(.a(s72), .b(s63), .c(s54), .sum(k15), .cout(c15));
    full_adder fa32(.a(s45), .b(s36), .c(s27), .sum(k16), .cout(c16));
    full_adder fa33(.a(s73), .b(s64), .c(s55), .sum(k17), .cout(c17));
    half_adder ha03(.a(s46), .b(s37), .sum(k18), .cout(c18));
    full_adder fa34(.a(s74), .b(s65), .c(s56), .sum(k19), .cout(c19));
    full_adder fa35(.a(s75), .b(s66), .c(s57), .sum(k20), .cout(c20));
    half_adder ha04(.a(s76), .b(s67), .sum(k21), .cout(c21));

    // Stage one
    half_adder ha10(.a(k02), .b(c01), .sum(k22), .cout(c22));
    full_adder fa10(.a(s03), .b(c02), .c(k03), .sum(k23), .cout(c23));
    full_adder fa11(.a(k04), .b(k05), .c(c03), .sum(k24), .cout(c24));
    full_adder fa12(.a(k06), .b(k07), .c(c04), .sum(k25), .cout(c25));
    full_adder fa13(.a(k08), .b(k09), .c(s06), .sum(k26), .cout(c26));
    half_adder ha11(.a(c06), .b(c07), .sum(k27), .cout(c27));
    full_adder fa14(.a(k10), .b(k11), .c(k12), .sum(k28), .cout(c28));
    half_adder ha12(.a(c08), .b(c09), .sum(k29), .cout(c29));
    full_adder fa15(.a(k13), .b(k14), .c(s17), .sum(k30), .cout(c30));
    full_adder fa16(.a(c10), .b(c11), .c(c12), .sum(k31), .cout(c31));
    full_adder fa17(.a(k15), .b(k16), .c(c13), .sum(k32), .cout(c32));
    full_adder fa18(.a(k17), .b(k18), .c(c15), .sum(k33), .cout(c33));
    full_adder fa19(.a(k19), .b(c17), .c(c18), .sum(k34), .cout(c34));
    half_adder ha13(.a(k20), .b(c19), .sum(k35), .cout(c35));
    half_adder ha14(.a(k21), .b(c20), .sum(k36), .cout(c36));

    // Stage two
    half_adder ha40(.a(k23), .b(c22), .sum(k37), .cout(c37));
    half_adder ha41(.a(c23), .b(k24), .sum(k38), .cout(c38));
    full_adder fa40(.a(c24), .b(k25), .c(c05), .sum(k39), .cout(c39));
    full_adder fa41(.a(c25), .b(k26), .c(k27), .sum(k40), .cout(c40));
    full_adder fa42(.a(c26), .b(c27), .c(k28), .sum(k41), .cout(c41));
    full_adder fa43(.a(c28), .b(c29), .c(k30), .sum(k42), .cout(c42));
    full_adder fa44(.a(c30), .b(c31), .c(k32), .sum(k43), .cout(c43));
    full_adder fa45(.a(c32), .b(c16), .c(k33), .sum(k44), .cout(c44));
    full_adder fa46(.a(c33), .b(s47), .c(k34), .sum(k45), .cout(c45));
    half_adder ha42(.a(k35), .b(c34), .sum(k46), .cout(c46));
    half_adder ha43(.a(c35), .b(k36), .sum(k47), .cout(c47));
    full_adder fa47(.a(s77), .b(c21), .c(c36), .sum(k48), .cout(c48));

    // Stage three
    half_adder ha50(.a(c37), .b(k38), .sum(k49), .cout(c49));
    full_adder fa50(.a(k39), .b(c38), .c(c49), .sum(k50), .cout(c50));
    full_adder fa51(.a(k40), .b(c39), .c(c50), .sum(k51), .cout(c51));
    full_adder fa52(.a(c40), .b(k41), .c(k29), .sum(k52), .cout(c52));
    full_adder fa53(.a(c41), .b(k31), .c(k42), .sum(k53), .cout(c53));
    full_adder fa54(.a(c14), .b(c42), .c(k43), .sum(k54), .cout(c54));
    full_adder fa55(.a(k44), .b(c43), .c(c54), .sum(k55), .cout(c55));
    full_adder fa56(.a(c44), .b(k45), .c(c55), .sum(k56), .cout(c56));
    full_adder fa57(.a(k46), .b(c45), .c(c56), .sum(k57), .cout(c57));
    full_adder fa58(.a(c46), .b(k47), .c(c57), .sum(k58), .cout(c58));
    full_adder fa59(.a(k48), .b(c47), .c(c58), .sum(k59), .cout(c59));

    // Stage four
    half_adder ha70(.a(c51), .b(k52), .sum(k60), .cout(c60));
    full_adder fa70(.a(c52), .b(k53), .c(c60), .sum(k61), .cout(c61));
    full_adder fa71(.a(c53), .b(k54), .c(c61), .sum(k62), .cout(c62));
    half_adder ha71(.a(k55), .b(c62), .sum(k63), .cout(c63));
    half_adder ha72(.a(k56), .b(c63), .sum(k64), .cout(c64));
    half_adder ha73(.a(k57), .b(c64), .sum(k65), .cout(c65));
    half_adder ha74(.a(k58), .b(c65), .sum(k66), .cout(c66));
    half_adder ha75(.a(k59), .b(c66), .sum(k67), .cout(c67));
    full_adder fa81(.a(c48), .b(c59), .c(c67), .sum(k68), .cout(c68));

   
    assign unsigned_result[0] = s00;
    assign unsigned_result[1] = k01;
    assign unsigned_result[2] = k22;
    assign unsigned_result[3] = k37;
    assign unsigned_result[4] = k49;
    assign unsigned_result[5] = k50;
    assign unsigned_result[6] = k51;
    assign unsigned_result[7] = k60;
    assign unsigned_result[8] = k61;
    assign unsigned_result[9] = k62;
    assign unsigned_result[10] = k63;
    assign unsigned_result[11] = k64;
    assign unsigned_result[12] = k65;
    assign unsigned_result[13] = k66;
    assign unsigned_result[14] = k67;
    assign unsigned_result[15] = k68 | c68;
    
  
    assign prod = sign_result ? (~unsigned_result + 1'b1) : unsigned_result;

endmodule
