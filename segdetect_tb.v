`timescale 1ns/1ns
module Segdetect_tb ();

reg Tclk, RST, A, B;
wire Z; 

  segdetect UUT ( .CLOCK(Tclk),
                .RESET(RST),
                .A(A),
                .Z(Z)        ); // instantiate UUT


always begin    // create free-running test clock with 10 ns period
  #6 Tclk = 0;  // 6 ns high
  #4 Tclk = 1;  // 4 ns low
end
 
initial begin    // What to do starting at time 0
  $monitor("Time:%d  RST=%b Tclk=%b A=%b  Z=%b",
           $time, RST, Tclk, A, Z); // Monitor all signals
  RST = 1;       // Apply reset
  A = 1;   // A is 1 too
  Tclk = 1;      // Start clock at 1 at time 0
  #15;           // Wait 15 ns
   RST = 0;       // unreset
  A = 0;  #10;    // 0
  A = 1;  #10;   // 01 
  A = 0;  #10;   // 010  
  A = 1;  #10;   // 0101 
  A = 1;  #10;   // 01011 
  A = 0;  #10;    // 010110 
  A = 0;  #10;    // 0101100  z=1  
  A = 1;  #10;    // 01  
  $stop(1);                         // end test
end

endmodule