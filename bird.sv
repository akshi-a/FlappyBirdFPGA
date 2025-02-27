module bird(
    input clock,
    input reset,
    input KEY0,
    input redAbove,
    input redBelow,
    input lossDetect,
    output reg lightOn
);

    //states
    reg PS, NS;
    parameter OFF = 1'b0, ON = 1'b1;
    
    reg [10:0] counter;

    always @(lossDetect or PS) begin
        if (lossDetect) begin
            case (PS)
                ON: NS <= OFF;
                OFF: NS <= ON;
            endcase
        end else begin  
            case (PS)
                ON: if (KEY0) NS = OFF;
                    else if(~KEY0) NS = OFF;
                    else NS = ON;
                OFF: if (redBelow&KEY0) NS = ON;
                    else if (redAbove&~KEY0) NS = ON;
                    else NS = OFF;
                default: NS = 1'bx;
            endcase
        end
    end

    always @(posedge clock) begin
        if (reset) begin
            PS <= OFF;
            counter <= 11'b00000000000;
        end else begin
            if (counter == 11'b11011111111) begin
                counter <= 11'b00000000000;
                PS <= NS;
            end else begin
                counter <= counter + 11'b00000000001;  
                PS <= NS;
            end
        end
    end

    assign lightOn = PS;
endmodule



/*
module bird(clock, reset, KEY0, lossDetect, redAbove, redBelow, lightOn); //add cutoff var
   input clock, reset;
	input KEY0, redAbove, redBelow;
	input lossDetect;
	//states
	reg PS, NS;
	parameter OFF = 1'b0, ON = 1'b1;
 
   //output 
	output reg lightOn;
	
	reg [10:0] counter;
	always @(*)
	 if (lossDetect) begin
	    case (PS)
	      ON: NS <= OFF;
	      OFF: NS <= ON;
		 endcase
	  end
	  else begin  
	    case (PS)
	      ON: if (KEY0) NS = OFF;
		       else if(~KEY0) NS = OFF;
			    else NS = ON;
		   OFF: if (redBelow&KEY0) NS = ON;
		       else if (redAbove&~KEY0) NS = ON;
				 else NS = OFF;
		   default: NS = 1'bx;
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

*/

module bird_testbench();
  reg clk, reset;
  reg KEY0, redAbove, redBelow;
  reg lossDetect;
  wire lightOn;  
  
  bird dut (.clock(clk), .reset, .KEY0, .redAbove, .redBelow, .lossDetect, .lightOn);

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
	 @(posedge clk); KEY0 <= 0; redAbove <= 0; redBelow <= 0; 	 
	 @(posedge clk); lossDetect <= 1;
	 @(posedge clk); lossDetect <= 0;
	 @(posedge clk); redBelow <= 1; //ON
	 @(posedge clk); 
    @(posedge clk); redBelow <= 0; //OFF
	 @(posedge clk);  
	 @(posedge clk); KEY0 <= 1; //OFF
	 @(posedge clk); 
	 @(posedge clk); redAbove <= 1; //ON
	 @(posedge clk); 
	 @(posedge clk); lossDetect <= 1;
	 @(posedge clk); lossDetect <= 0;
	 @(posedge clk); redAbove <= 0; //OFF
	 @(posedge clk); redAbove <= 1; 
	 @(posedge clk); 
	 @(posedge clk); reset <= 1;
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); 

	 $stop;       // End the simulation
  end
endmodule

