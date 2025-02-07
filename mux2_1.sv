// Implementation of a 2:1 multiplexor
// The output will match the corresponding input (i0 or i1) based on
// the value of the selector bit (sel).
module mux2_1 (
  output logic out
  ,input  logic i0, i1, sel
  );

  assign out = (i1 & sel) | (i0 & ~sel);
endmodule  // mux2_1