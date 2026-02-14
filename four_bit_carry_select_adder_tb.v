`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2026 05:37:35
// Design Name: 
// Module Name: four_bit_carry_select_adder_tb
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


module four_bit_carry_select_adder_tb();
    reg [3:0] a , b;
    reg cin;
    wire [3:0] s;
    wire cout;
    
    four_bit_carry_select_adder dut (.a(a) , .b(b) , .cin(cin) , .s(s) , .cout(cout));
    
    initial begin
        repeat(50) begin
            a=$random() & 4'b1111 ;
            b=$random() & 4'b1111 ;
            cin=$random() & 1'b1 ;
            #10;
            if ({cout,s}!=a+b+cin) begin
                $display("Error a=%0d , b=%0d , cin=%0d" , a,b,cin);
                $stop;
            end
        end
        $display("All Test Cases Passed");
        #10 $finish;
    end
endmodule
