module bird_top(clock, reset, KEY0, lossDetect, redBelow, lightOn); //add cutoff var
   input clock, reset;
	input KEY0, redBelow;
	input lossDetect;
	//states
	reg PS, NS;
	parameter OFF = 1'b0, ON = 1'b1;
 
   //output 
	output reg lightOn;
	
	reg [10:0] counter;
	//later reg count [7:0];
	always @(*)
	  if (lossDetect) begin
	    case (PS)
	      ON: NS <= OFF;
	      OFF: NS <= ON;
		 endcase
	  end
	  else begin
	    case (PS)
	      ON: if (KEY0) NS = ON;
		       else if(~KEY0) NS = OFF;
			    else NS = ON;
		   OFF: if (redBelow&KEY0) NS = ON;
				 else NS = OFF;
	    endcase
	  end	 

	always@(posedge clock)
	  if (reset)
	    PS <= OFF;
	  else if (counter == 11'b11011111111) begin
	    counter <= 11'b00000000000;
		 PS <= NS;
		 end
	  else begin
	    counter <= counter + 11'b00000000001;  
	    PS <= PS;
		 end

   assign lightOn = PS;
endmodule

module bird_top_testbench();
  reg clk, reset;
  reg KEY0, redBelow;
  reg lossDetect;
  wire lightOn;  
  
  bird_top dut (.clock(clk), .reset, .KEY0, .redBelow, .lightOn);

  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial clk=1;
  always begin
    #(CLOCK_PERIOD/2); clk = ~clk;
  end
  
  // Set up the inputs to the design (each line is a clock cycle)
  initial begin
    @(posedge clk); reset <= 1;
	 @(posedge clk); reset <= 0;
	 @(posedge clk); KEY0 <= 0;  redBelow <= 0; 	 
	 @(posedge clk); 
	 @(posedge clk); redBelow <= 1; //ON
	 @(posedge clk); 
    @(posedge clk); redBelow <= 0; //OFF
	 @(posedge clk);  
	 @(posedge clk); KEY0 <= 1; //OFF
	 @(posedge clk); lossDetect <= 1;
	 @(posedge clk); redBelow <= 1; //ON
	 @(posedge clk); 
	 @(posedge clk); redBelow <= 0; //OFF
	 @(posedge clk); redBelow <= 1; 
	 @(posedge clk); 
	 @(posedge clk); reset <= 1;
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); 

	 $stop;       // End the simulation
  end
endmodule