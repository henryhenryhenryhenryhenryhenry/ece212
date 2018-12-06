`timescale 1ns/1ns
module VrSMex_tb ();

reg Tclk, RST, A, B;
wire Z; 

  VrSMexra UUT ( .CLOCK(Tclk),
                .RESET(RST),
                .A(A),
                .B(B),
                .Z(Z)        ); // instantiate UUT

task checkZ;
  input stepnum, expectZ;
  integer stepnum; reg expectZ;
  begin
    if (Z != expectZ) begin
      $display($time," Error, step %d, expected %b, got %b",
               stepnum, expectZ, Z); $stop(1); 
     end
  end
endtask 

always begin    // create free-running test clock with 10 ns period
  #6 Tclk = 0;  // 6 ns high
  #4 Tclk = 1;  // 4 ns low
end
 
initial begin    // What to do starting at time 0
  $monitor("Time:%d  RST=%b Tclk=%b A=%b B=%b Z=%b",
           $time, RST, Tclk, A, B, Z); // Monitor all signals
  RST = 1;       // Apply reset
  A = 1; B = 1;  // A and B are 1 too
  Tclk = 1;      // Start clock at 1 at time 0
  #15;           // Wait 15 ns
  checkZ(1,0);   // Expect Z=0 initially 
  RST = 0;       // unreset
  A = 1; B = 1; #10;  checkZ(2,0);  // still Z=0 after INIT
  A = 1; B = 0; #10;  checkZ(3,1);  // Two 1s in a row, want Z=1 
  A = 0; B = 1; #10;  checkZ(4,1);  // B=1 should hold Z=1  
  A = 1; B = 0; #10;  checkZ(5,0);  // B=0 releases it  
  A = 0; B = 1; #10;  checkZ(6,0);  // B=1 but nothing to hold 
  A = 0; B = 0; #10;  checkZ(7,1);  // But now two 0s in a row 
  A = 1; B = 1; #10;  checkZ(8,1);  // B=1 should hold Z=1  
  A = 0; B = 0; #10;  checkZ(9,0);  // B=0 releases it  
  $stop(1);                         // end test
end

endmodule

