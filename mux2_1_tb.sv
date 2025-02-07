// Testbench for the mux2_1 module
// Runs through all 8 combinations of inputs, changing every 10 time units.
module mux2_1_tb();
  logic out;
  logic i0, i1, sel;

  // instantiate device under test (dut)
  mux2_1 dut (.out, .i0, .i1, .sel);

  // test input sequence
  initial begin
    sel=0; i0=0; i1=0; #10;
    sel=0; i0=0; i1=1; #10;
    sel=0; i0=1; i1=0; #10;
    sel=0; i0=1; i1=1; #10;
    sel=1; i0=0; i1=0; #10;
    sel=1; i0=0; i1=1; #10;
    sel=1; i0=1; i1=0; #10;
    sel=1; i0=1; i1=1; #10;
    $stop;  // needed to pause the simulation without closing it
  end
endmodule  // mux2_1_tb
