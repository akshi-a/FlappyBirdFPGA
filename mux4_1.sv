// Implementation of a 4:1 multiplexor using mux2_1 modules
module mux4_1 (
  output logic out
  ,input  logic i00, i01, i10, i11, sel0, sel1
  );

  logic v0, v1;

  mux2_1 m0(.out(v0), .i0(i00), .i1(i01), .sel(sel0));
  mux2_1 m1(.out(v1), .i0(i10), .i1(i11), .sel(sel0));
  mux2_1 m (.out(out), .i0(v0), .i1(v1), .sel(sel1));
endmodule  // mux4_1
