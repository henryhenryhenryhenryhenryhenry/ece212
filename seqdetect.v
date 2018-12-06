module segdetect( CLOCK, RESET, A, Z );
  input CLOCK, RESET, A;
  output Z;
  reg Z;
  reg [2:0] Sreg, Snext;          // State register and next state
  parameter [2:0] S0 = 3'b000,  // Define the states
                  S1   = 3'b001,
                  S2   = 3'b010,
                  S3  = 3'b011,
                  S4  = 3'b100,
                  S5  = 3'b101;

  always @ (posedge CLOCK or posedge RESET) // Create state memory
    if (RESET==1) Sreg <= S0; else Sreg <= Snext;

  always @ (A, Sreg) begin  // Next-state logic
    case (Sreg)
      S0:   if (A==0)  Snext = S0;
              else       Snext = S1;
      S1:     if (A==0)  Snext = S2;
              else       Snext = S0;
      S2:     if (A==0)  Snext = S0;
              else       Snext = S3;
      S3:    if (A==0)  Snext = S2;
              else  Snext = S4;
     S4:    if (A==0)  Snext = S5;
              else  Snext = S0;
     S5:    if (A==0) Snext = S0;
              else  Snext = S1;
      default Snext = S0;
    endcase
  end

  always @ (Sreg)        // Output logic
    case (Sreg)
      S0, S1, S2, S3, S4: Z = 0;
      S5:     if (A==0) Z = 1;
                  else Z=0;
      default       Z = 0;
    endcase
endmodule
