`timescale 1 ns / 100 ps

module test_fixture;
	reg done;
	reg [2:0] test_input;
	wire f1, f2;

	initial
	begin
	
	   // initialize done signal to 0
	   done = 1'b0;

           $display ("ECE 212 Homework 4 Spring 2017 \n");
           // Modify the string YOUR NAME HERE (below) with your first & last name
           $display ("YOUR NAME HERE \n");

           $display ("Go Wolfpack \n");

          // Modify the FOLLOWING text string to identify this test run
           $display ("First run with no change to circuit definition \n");

           $display ("ABC  f1  f2 \n");
           $monitor (test_input[2],test_input[1],test_input[0],,, f1,,, f2);
                  
	   // test 000 case
	   test_input[2] = 0;
	   test_input[1] = 0;
	   test_input[0] = 0;

	   // wait 5 ns, then test 001 case
	   #5 
	   test_input[2] = 0;
	   test_input[1] = 0;
	   test_input[0] = 1;

	   // wait another 5 ns, then test 010 case
	   #5
	   test_input[2] = 0;
	   test_input[1] = 1;
	   test_input[0] = 0;

	   // wait another 5 ns, then test 011 case
	   #5
	   test_input[2] = 0;
	   test_input[1] = 1;
	   test_input[0] = 1;

	   // wait another 5 ns, then test 100 case
	   #5
	   test_input[2] = 1;
	   test_input[1] = 0;
	   test_input[0] = 0;

	   // wait another 5 ns, then test 101 case
	   #5
	   test_input[2] = 1;
	   test_input[1] = 0;
	   test_input[0] = 1;

	   // wait another 5 ns, then test 110 case
	   #5
	   test_input[2] = 1;
	   test_input[1] = 1;
	   test_input[0] = 0;

	   // wait another 5 ns, then test 111 case
	   #5
	   test_input[2] = 1;
	   test_input[1] = 1;
	   test_input[0] = 1;


	   // Added time delay to extend simulation time for better viewing.
	   #5 done = 1'b1;

	   $finish;       // finished with simulation
	end
	

	// Instantiate two copies of Circuit #1 - but different implementations.
	circuit1_structural u3 (test_input[2], test_input[1], test_input[0], f1);
	circuit1_dataflow u4 (test_input[2], test_input[1], test_input[0], f2);

endmodule	// test_fixture
