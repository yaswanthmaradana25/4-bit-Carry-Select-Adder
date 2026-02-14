module carry_block(
                   input a,b,cin,
                   output cout
                  );
                  
    assign cout = (a & b) | cin & (a ^ b);
endmodule
