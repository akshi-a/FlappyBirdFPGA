module detect_collision(clock,reset,r0,r1,r2,r3,r4,r5,r6,r7,g0,g1,g2,g3,g4,g5,g6,g7,groundOut, lossDetect);

input clock, reset;
input r0, r1, r2, r3, r4, r5, r6, r7;
input g0, g1, g2, g3, g4, g5, g6, g7;
input groundOut;
output lossDetect;
reg PS,NS;

parameter ON = 1'b1, OFF = 1'b0;

always @(*)
  case (PS)
    ON: NS <= ON;
	 OFF: if ((r0&g0)^(r1&g1)^(r2&g2)^(r3&g3)^(r4&g4)^(r5&g5)^(r6&g6)^(r7&g7)^(groundOut)) NS <= ON;
	      else NS <= OFF;
  endcase

always @(posedge clock)
  if (reset) PS <= 1'b0;
  else PS <= NS;
  
assign lossDetect = PS;

endmodule

module detect_collision_testbench();
  reg clk, reset;
  reg r0, r1, r2, r3, r4, r5, r6, r7;
  reg g0, g1, g2, g3, g4, g5, g6, g7;
  reg groundOut;
  wire lossDetect;
  
  detect_collision dut (.clock(clk), .reset, .r0, .r1, .r2, .r3, .r4, .r5, .r6, .r7, .g0, .g1, .g2, .g3, .g4, .g5, .g6, .g7, .groundOut, .lossDetect);
  
  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial clk=1;
  always begin
    #(CLOCK_PERIOD/2); clk = ~clk;
  end
    
  initial begin
    @(posedge clk); reset <= 1;
	 @(posedge clk); reset <= 0;  r0<= 0; r1<= 0; r2<= 0; r3<= 0; r4<= 0; r5<= 0; r6<= 0; r7<= 0;
	 g0<= 0; g1<= 0; g2<= 0; g3<= 0; g4<= 0; g5<= 0; g6<= 0; g7<= 0; groundOut <= 0;
	 @(posedge clk); r0<= 1;
	 @(posedge clk); 
	 @(posedge clk); r0<= 0;
	 @(posedge clk);
	 @(posedge clk); r1<= 1;
	 @(posedge clk); 
	 @(posedge clk); r1<= 0;
	 @(posedge clk);
	 @(posedge clk); r2<= 1;
	 @(posedge clk); 
	 @(posedge clk); r2<= 0;
	 @(posedge clk);
	 @(posedge clk); r3<= 1;
	 @(posedge clk); 
	 @(posedge clk); r3<= 0;
	 @(posedge clk);
	 @(posedge clk); r4<= 1;
	 @(posedge clk); 
	 @(posedge clk); r4<= 0;
	 @(posedge clk);
	 @(posedge clk); r5<= 1;
	 @(posedge clk); 
	 @(posedge clk); r5<= 0;
	 @(posedge clk);
	 @(posedge clk); r6<= 1;
	 @(posedge clk); 
	 @(posedge clk); r6<= 0;
	 @(posedge clk); 
	 @(posedge clk); r7<= 1;
	 @(posedge clk); 
	 @(posedge clk); r7<= 0;
	 @(posedge clk);
	 @(posedge clk); g0<= 1;
	 @(posedge clk); 
	 @(posedge clk); g0<= 0;
	 @(posedge clk);
	 @(posedge clk); g1<= 1;
	 @(posedge clk); 
	 @(posedge clk); g1<= 0;
	 @(posedge clk);
	 @(posedge clk); g2<= 1;
	 @(posedge clk); 
	 @(posedge clk); g2<= 0;
	 @(posedge clk);
	 @(posedge clk); g3<= 1;
	 @(posedge clk); 
	 @(posedge clk); g3<= 0;
	 @(posedge clk);
	 @(posedge clk); g4<= 1;
	 @(posedge clk); 
	 @(posedge clk); g4<= 0;
	 @(posedge clk);
	 @(posedge clk); g5<= 1;
	 @(posedge clk); 
	 @(posedge clk); g5<= 0;
	 @(posedge clk);
	 @(posedge clk); g6<= 1;
	 @(posedge clk); 
	 @(posedge clk); g6<= 0;
	 @(posedge clk);
	 @(posedge clk); g7<= 1;
	 @(posedge clk); 
	 @(posedge clk); g7<= 0;
	 @(posedge clk);
	 @(posedge clk); groundOut<= 1;
	 @(posedge clk); 
	 @(posedge clk); groundOut<= 0;
	 @(posedge clk);
	 @(posedge clk); g7 <= 1;
	 @(posedge clk); g6 <= 1;
	 @(posedge clk); g0 <= 1;
	 @(posedge clk); r3 <= 1;
	 @(posedge clk); r7 <= 1;
	 @(posedge clk); r6 <= 1;
	 @(posedge clk); 
    @(posedge clk); reset <= 1;g7 <= 0;g7 <= 0;g6 <= 0;g0 <= 0;r3 <= 0;
	 @(posedge clk); reset <= 0;
    @(posedge clk); 
	 $stop;       // End the simulation
  end
endmodule