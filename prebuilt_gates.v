// 2-input AND
module AND2 (a, b, f);
	input a;	
                  input b;	
                  output f;        
// Dataflow verilog style.	
assign f = (a & b);
endmodule
// 2-input OR
module OR2 (a, b, f);	
        input a;	
        input b;	
        output f;        
// Dataflow verilog style.	
        assign f = (a | b);
        endmodule
// 2-input NAND
module NAND2 (a, b, f);
            input a;	
            input b;	
            output f;        
// Dataflow verilog style.	
         assign f = ~(a & b);
endmodule
// 2-input NOR
module NOR2 (a, b, f);
	input a;	
                  input b;	
                 output f;       
// Dataflow verilog style.	
               assign f = ~(a | b);
endmodule
// inverter (NOT gate)
module INV (a, f);	
         input a;	
         output f;        
// Dataflow verilog style.	
          assign f = ~a;
endmodule