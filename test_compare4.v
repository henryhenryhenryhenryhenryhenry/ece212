`include "compare4.v"

module test_compare4;

reg [7:0] reg1;
wire [3:0] x, y;



compare4 u1 (GT, EQ, LT, x, y);

initial begin

     $display ("ECE 212 Homework 4 Spring 2017 \n");
  // Modify the string YOUR NAME HERE (below) with your first & last name
     $display ("YOUR NAME HERE \n");

     $display ("Go Wolfpack \n");

    reg1 = 8'bzzzzzzzz;
   
       #1 reg1 = 8'b00000000; // 0
       #20 reg1 = 8'b11010000; // 208
       #5 reg1 = 8'b11100111; // 231
       #5 reg1 = 8'b00100000; // 32
       #5 reg1 = 8'b11101001; // 233
       #5 reg1 = 8'b10100001; // 161
       #5 reg1 = 8'b00011000; // 24
       #5 reg1 = 8'b01000111; // 71
       #5 reg1 = 8'b10001100; // 140
       #5 reg1 = 8'b11110101; // 245
       #5 reg1 = 8'b11110111; // 247
       #5 reg1 = 8'b00101000; // 40
       #5 reg1 = 8'b11111000; // 248
       #5 reg1 = 8'b11110110; // 246
       #5 reg1 = 8'b01111100; // 124
       #5 reg1 = 8'b11001100; // 204
       #5 reg1 = 8'b00100100; // 36
       #5 $finish;
    end

always @(GT or EQ or LT)
    begin
     $monitor("x = %b; y = %b; GT = %b; EQ = %b; LT = %b\n", x, y, GT, EQ, LT);
        end

assign x[3] = reg1[7];
assign x[2] = reg1[5];
assign y[3] = reg1[6];
assign y[2] = reg1[4];
assign x[1] = reg1[3];
assign x[0] = reg1[1];
assign y[1] = reg1[2];
assign y[0] = reg1[0];

endmodule