`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 22:25:26
// Design Name: 
// Module Name: four_bit_carry_select_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module four_bit_carry_select_adder(
                                    input [3:0] a , b,
                                    input cin,
                                    output [3:0] s,
                                    output cout
                                   );

wire [3:0]carry0  , carry1;
wire co0,co1,co2;  

//carry0                              
carry_block cb0 (.a(a[0]) , .b(b[0]) , .cin(1'b0) , .cout(carry0[0]));
carry_block cb1 (.a(a[1]) , .b(b[1]) , .cin (carry0[0]) , .cout(carry0[1]));
carry_block cb2 (.a(a[2]) , .b(b[2]) , .cin (carry0[1]) , .cout(carry0[2]));
carry_block cb3 (.a(a[3]) , .b(b[3]) , .cin (carry0[2]) , .cout(carry0[3]));

//carry1

carry_block cb4 (.a(a[0]) , .b(b[0]) , .cin(1'b1) , .cout(carry1[0]));
carry_block cb5 (.a(a[1]) , .b(b[1]) , .cin (carry1[0]) , .cout(carry1[1]));
carry_block cb6 (.a(a[2]) , .b(b[2]) , .cin (carry1[1]) , .cout(carry1[2]));
carry_block cb7 (.a(a[3]) , .b(b[3]) , .cin (carry1[2]) , .cout(carry1[3]));

//mux foe selecting the carry
mux_2_to_1 mux0(.y(co0) ,.a(carry0[0]) , .b(carry1[0]) , .sel(cin) );
mux_2_to_1 mux1(.y(co1) ,.a(carry0[1]) , .b(carry1[1]) , .sel(cin) );
mux_2_to_1 mux2(.y(co2) ,.a(carry0[2]) , .b(carry1[2]) , .sel(cin) );
mux_2_to_1 mux3(.y(cout) ,.a(carry0[3]) , .b(carry1[3]) , .sel(cin) );

//generation of sum using the carry
sum_block sum0(.a(a[0]) , .b(b[0]) ,.cin(cin) , .s(s[0]));   
sum_block sum1(.a(a[1]) , .b(b[1]) ,.cin(co0) , .s(s[1]));
sum_block sum2(.a(a[2]) , .b(b[2]) ,.cin(co1) , .s(s[2]));
sum_block sum3(.a(a[3]) , .b(b[3]) ,.cin(co2) , .s(s[3]));         
endmodule
