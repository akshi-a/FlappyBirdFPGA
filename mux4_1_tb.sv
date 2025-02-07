// Testbench for the mux4_1 module
// Runs through all 64 combinations of inputs, changing every 10 time units.
module mux4_1_tb();
  logic out;
  logic i00, i01, i10, i11, sel0, sel1;

  // instantiate device under test
  mux4_1 dut (.out, .i00, .i01, .i10, .i11, .sel0, .sel1);

  // test input sequence
  integer i;
  initial begin
    for(i=0; i<64; i++) begin
      {sel1, sel0, i00, i01, i10, i11} = i; #10;
    end
    $stop;  // needed to pause the simulation without closing it
  end
endmodule  // mux4_1_tb
