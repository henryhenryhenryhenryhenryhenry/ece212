module test_compare2;

reg [3:0] reg1;
wire [1:0] x, y;

 
compare2 u1 (GT, EQ, LT, x, y);

initial begin

$display ("ECE 212 Homework 4 Spring 2017 \n");
// Modify the string YOUR NAME HERE (below) with your first & last name
 $display ("YOUR NAME HERE \n");

   $display ("Go Wolfpack \n");

    reg1 = 4'bzzzz;
    
       #1 reg1 = 4'b0000;
       #5 reg1 = 4'b0001;
       #5 reg1 = 4'b0010;
       #5 reg1 = 4'b0011;
       #5 reg1 = 4'b0100;
       #5 reg1 = 4'b0101;
       #5 reg1 = 4'b0110;
       #5 reg1 = 4'b0111;
       #5 reg1 = 4'b1000;
       #5 reg1 = 4'b1001;
       #5 reg1 = 4'b1010;
       #5 reg1 = 4'b1011;
       #5 reg1 = 4'b1100;
       #5 reg1 = 4'b1101;
       #5 reg1 = 4'b1110;
       #5 reg1 = 4'b1111;
       #5 $finish;
    end

always @(GT or EQ or LT)
    begin
    $monitor("x1y1x0y0 = %b; GT = %b; EQ = %b; LT = %b\n", reg1, GT, EQ, LT);
        end

assign x[1] = reg1[3];
assign x[0] = reg1[1];
assign y[1] = reg1[2];
assign y[0] = reg1[0];

endmodule