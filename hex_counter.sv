module hex_counter (clock, reset, detect_score, HEX, out_left);
   input clock, reset, detect_score;
	output out_left;
	output reg [6:0] HEX;
	reg [6:0] PS, NS;

	parameter out0 = 7'b1000000, out1 = 7'b1111001, out2 = 7'b0100100, out3 = 7'b0110000;
	parameter out4 = 7'b0011001, out5 = 7'b0010010, out6 = 7'b0000010, out7 = 7'b1111000;
	parameter out8 = 7'b0000000, out9 = 7'b0010000;
	
	parameter in0 = 4'b0000, in1 = 4'b0001, in2 = 4'b0010, in3 = 4'b0011, in4 = 4'b0100; 
   parameter in5 = 4'b0101, in6 = 4'b0110, in7 = 4'b0111, in8 = 4'b1000, in9 = 4'b1001; 	
	wire pulse_score;
	
	wire[3:0] count_this;
	
   //Pulse_FF pulse (pulse_score, detect_score, reset, clock);
	always@(posedge detect_score or posedge reset)
	   if (reset) count_this <= 4'b0000;
	   else if (count_this == in9) begin
		  count_this <= in0;
		  out_left <= 1'b1;
		  end
	   else begin
		  count_this <= count_this + 4'b0001;
		  out_left <= 1'b0;
        end
		  
	always@(*) begin
	   case (count_this)
		  in0: NS = out0;
		  in1: NS = out1;
		  in2: NS = out2;
		  in3: NS = out3;
		  in4: NS = out4;
		  in5: NS = out5;
		  in6: NS = out6;
		  in7: NS = out7;
		  in8: NS = out8;
		  in9: NS = out9;
		  default: NS = 7'b1000000;
		endcase
		end
		
	always@(posedge clock)
	  if (reset)
		 PS <= out0;
	  else PS <= NS;
	  
	assign HEX = PS;


endmodule

module hex_counter_testbench();
   reg clk, reset, detect_score;
	reg out_left;
	wire [6:0] HEX;
  hex_counter hexy (clk, reset, detect_score, HEX, out_left);

  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial clk=1;
  always begin
    #(CLOCK_PERIOD/2); clk = ~clk;
  end
  
  // Set up the inputs to the design (each line is a clock cycle)
  initial begin
    @(posedge clk); reset <= 1;
	 @(posedge clk); reset <= 0;detect_score <=0;
	 @(posedge clk); 
	 @(posedge clk); detect_score <=1;
	 @(posedge clk); 
	 @(posedge clk); detect_score <=0;	 
	 @(posedge clk);  
	 @(posedge clk); detect_score <=1;
	 @(posedge clk); 
	 @(posedge clk); detect_score <=0;
	 @(posedge clk); 
	 @(posedge clk); detect_score <=1;
	 @(posedge clk); 
	 @(posedge clk); detect_score <=0;	 
	 @(posedge clk);  
	 @(posedge clk); detect_score <=1;
	 @(posedge clk); 
	 @(posedge clk); detect_score <=0;
	 @(posedge clk); 
	 @(posedge clk); detect_score <=1;
	 @(posedge clk); 
	 @(posedge clk); detect_score <=0;	 
	 @(posedge clk);  
	 @(posedge clk); detect_score <=1;
	 @(posedge clk); 
	 @(posedge clk); detect_score <=0;
	 @(posedge clk);
	 @(posedge clk); reset <=1;
	 @(posedge clk); 
	 @(posedge clk); reset <=0;	 
	 @(posedge clk);  
	 @(posedge clk); detect_score <=1;
	 @(posedge clk); 
	 @(posedge clk); detect_score <=0;
	 @(posedge clk);  
	 

	 $stop;       // End the simulation
  end
endmodule