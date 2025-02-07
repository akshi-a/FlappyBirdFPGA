module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, GPIO_0);
   input        CLOCK_50; // 50 MHz "master" clock
   output reg [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
   output reg [9:0] LEDR;
   input  [3:0] KEY;   // True when not pressed, False when pressed
   input  [9:0] SW;
   output [35:0] GPIO_0;  //inout pins from the DE1 board
   reg [7:0][7:0] green_array, red_array;
  
   // Default values, turns off the HEX displays    
   assign HEX3 = 7'b1111111;   
   assign HEX4 = 7'b1111111; 
   assign HEX5 = 7'b1111111;     
  
   //wires for lights
   wire[7:0] red, green, rowSink;
	
	//wire for pseudorandom
	wire [3:0] outLSFR6;
	
	//wire for loss detection signal
	wire groundOut;
	wire lossDetect;
	
	//wire score detection
	wire detect_score;
	wire out_score, out_score10, out_score100;
 
   //reset
   wire reset;
   assign reset = SW[9]; // Reset when SW[9] is pressed
  
   //hookup GPIO_0
   assign GPIO_0[12] = rowSink[0];
   assign GPIO_0[13] = rowSink[1];
   assign GPIO_0[14] = rowSink[2];
   assign GPIO_0[15] = rowSink[3];
   assign GPIO_0[16] = rowSink[4];
   assign GPIO_0[17] = rowSink[5];
   assign GPIO_0[18] = rowSink[6];
   assign GPIO_0[19] = rowSink[7];
   assign GPIO_0[20] = red[0];
   assign GPIO_0[21] = red[1];
   assign GPIO_0[22] = red[2];
   assign GPIO_0[23] = red[3];
   assign GPIO_0[24] = red[4];
   assign GPIO_0[25] = red[5];
   assign GPIO_0[26] = red[6];
   assign GPIO_0[27] = red[7];
   assign GPIO_0[28] = green[0];
   assign GPIO_0[29] = green[1];
   assign GPIO_0[30] = green[2];
   assign GPIO_0[31] = green[3];
   assign GPIO_0[32] = green[4];
   assign GPIO_0[33] = green[5];
   assign GPIO_0[34] = green[6];
   assign GPIO_0[35] = green[7];

   // Generate clk off of CLOCK_50, whichClock picks rate
   wire [31:0] clk;
   parameter whichClock = 11;
   clock_divider cdiv (CLOCK_50, clk);

	//the many column wire sets for pipes boi
	//--col 0--//
	wire [7:0] greenCol_0;
	assign green_array[7][0] = greenCol_0[7];
	assign green_array[6][0] = greenCol_0[6];
	assign green_array[5][0] = greenCol_0[5];
	assign green_array[4][0] = greenCol_0[4];
	assign green_array[3][0] = greenCol_0[3];
	assign green_array[2][0] = greenCol_0[2];
	assign green_array[1][0] = greenCol_0[1];
	assign green_array[0][0] = greenCol_0[0];
	
	//--col 1--//
	wire [7:0] greenCol_1;
	assign green_array[7][1] = greenCol_1[7];
	assign green_array[6][1] = greenCol_1[6];
	assign green_array[5][1] = greenCol_1[5];
	assign green_array[4][1] = greenCol_1[4];
	assign green_array[3][1] = greenCol_1[3];
	assign green_array[2][1] = greenCol_1[2];
	assign green_array[1][1] = greenCol_1[1];
	assign green_array[0][1] = greenCol_1[0];
		
	//--col 2--//
	wire [7:0] greenCol_2;
	assign green_array[7][2] = greenCol_2[7];
	assign green_array[6][2] = greenCol_2[6];
	assign green_array[5][2] = greenCol_2[5];
	assign green_array[4][2] = greenCol_2[4];
	assign green_array[3][2] = greenCol_2[3];
	assign green_array[2][2] = greenCol_2[2];
	assign green_array[1][2] = greenCol_2[1];
	assign green_array[0][2] = greenCol_2[0];
	
	//--col 3--//
	wire [7:0] greenCol_3;
	assign green_array[7][3] = greenCol_3[7];
	assign green_array[6][3] = greenCol_3[6];
	assign green_array[5][3] = greenCol_3[5];
	assign green_array[4][3] = greenCol_3[4];
	assign green_array[3][3] = greenCol_3[3];
	assign green_array[2][3] = greenCol_3[2];
	assign green_array[1][3] = greenCol_3[1];
	assign green_array[0][3] = greenCol_3[0];
	
	//--col 4--//
	wire [7:0] greenCol_4;
	assign green_array[7][4] = greenCol_4[7];
	assign green_array[6][4] = greenCol_4[6];
	assign green_array[5][4] = greenCol_4[5];
	assign green_array[4][4] = greenCol_4[4];
	assign green_array[3][4] = greenCol_4[3];
	assign green_array[2][4] = greenCol_4[2];
	assign green_array[1][4] = greenCol_4[1];
	assign green_array[0][4] = greenCol_4[0];
	
	//--col 5--//
	wire [7:0] greenCol_5;
	assign green_array[7][5] = greenCol_5[7];
	assign green_array[6][5] = greenCol_5[6];
	assign green_array[5][5] = greenCol_5[5];
	assign green_array[4][5] = greenCol_5[4];
	assign green_array[3][5] = greenCol_5[3];
	assign green_array[2][5] = greenCol_5[2];
	assign green_array[1][5] = greenCol_5[1];
	assign green_array[0][5] = greenCol_5[0];
	
	//--col 6--//
	wire [7:0] greenCol_6;
	assign green_array[7][6] = greenCol_6[7];
	assign green_array[6][6] = greenCol_6[6];
	assign green_array[5][6] = greenCol_6[5];
	assign green_array[4][6] = greenCol_6[4];
	assign green_array[3][6] = greenCol_6[3];
	assign green_array[2][6] = greenCol_6[2];
	assign green_array[1][6] = greenCol_6[1];
	assign green_array[0][6] = greenCol_6[0];
		
	//--col 7--//
	wire [7:0] greenCol_7;
	assign green_array[7][7] = greenCol_7[7];
	assign green_array[6][7] = greenCol_7[6];
	assign green_array[5][7] = greenCol_7[5];
	assign green_array[4][7] = greenCol_7[4];
	assign green_array[3][7] = greenCol_7[3];
	assign green_array[2][7] = greenCol_7[2];
	assign green_array[1][7] = greenCol_7[1];
	assign green_array[0][7] = greenCol_7[0];
  
   //the red 'bird' dot movement							  
   //you go birdy		
   pretty_bird_top    r7 (clk[whichClock], reset, ~KEY[0], lossDetect,                   red_array[6][6], red_array[7][6]);
   pretty_bird        r6 (clk[whichClock], reset, ~KEY[0], lossDetect, red_array[7][6] , red_array[5][6], red_array[6][6]);
   pretty_bird        r5 (clk[whichClock], reset, ~KEY[0], lossDetect, red_array[6][6] , red_array[4][6], red_array[5][6]);
   pretty_bird_init   r4 (clk[whichClock], reset, ~KEY[0], lossDetect, red_array[5][6] , red_array[3][6], red_array[4][6]);
   pretty_bird        r3 (clk[whichClock], reset, ~KEY[0], lossDetect, red_array[4][6] , red_array[2][6], red_array[3][6]);
   pretty_bird        r2 (clk[whichClock], reset, ~KEY[0], lossDetect, red_array[3][6] , red_array[1][6], red_array[2][6]);
   pretty_bird        r1 (clk[whichClock], reset, ~KEY[0], lossDetect, red_array[2][6] , red_array[0][6], red_array[1][6]);
   pretty_bird_bottom r0 (clk[whichClock], reset, ~KEY[0], lossDetect, red_array[1][6]                  , red_array[0][6], groundOut);
	
   //help the pipes be random-ish.  6bit LSFR, mid 4 become our selector
	LSFR6 myRando (clk[whichClock], reset, outLSFR6);
	
	//green pipes
	//you go mr pipes
	pretty_pipe_init c0(clk[whichClock], reset, lossDetect, outLSFR6, greenCol_7,greenCol_3, greenCol_0);
	pretty_pipe      c1(clk[whichClock], reset, lossDetect, greenCol_0, greenCol_1);
	pretty_pipe      c2(clk[whichClock], reset, lossDetect, greenCol_1, greenCol_2);
	pretty_pipe      c3(clk[whichClock], reset, lossDetect, greenCol_2, greenCol_3);
	pretty_pipe      c4(clk[whichClock], reset, lossDetect, greenCol_3, greenCol_4);
	pretty_pipe      c5(clk[whichClock], reset, lossDetect, greenCol_4, greenCol_5);
	pretty_pipe      c6(clk[whichClock], reset, lossDetect, greenCol_5, greenCol_6);
	pretty_pipe      c7(clk[whichClock], reset, lossDetect, greenCol_6, greenCol_7);
	
	//collision detection
	detect_collision failMuch (clk[whichClock],reset,red_array[0][6],red_array[1][6],red_array[2][6],
	                 red_array[3][6],red_array[4][6],red_array[5][6],red_array[6][6],
						  red_array[7][6],green_array[0][6],green_array[1][6],green_array[2][6],
						  green_array[3][6],green_array[4][6],green_array[5][6],
						  green_array[6][6],green_array[7][6], groundOut, lossDetect);
						  
	//score detection
	detect_score score (green_array[7][7] ,green_array[0][7] , detect_score);
	
	//HEX Output
	hex_counter winRawr (clk[whichClock], reset, detect_score, HEX0, out_score);
	hex_counter winRawr10 (clk[whichClock], reset, out_score, HEX1, out_score10);
   hex_counter winRawr100 (clk[whichClock], reset, out_score10, HEX2, out_score100);
	
	
   //drives the matrix LED 8x8, provided by CSE369 handout 
   led_matrix_driver lights (clk[whichClock], red_array, green_array, red, green, rowSink);

  
  
endmodule

// divided_clocks[0]=25MHz, [1]=12.5Mhz, ... [23]=3Hz, [24]=1.5Hz, [25]=0.75Hz
module clock_divider (clock, divided_clocks);
  input               clock;
    output reg [31:0] divided_clocks;
  
  initial
    divided_clocks = 0;
  
  always @(posedge clock)
    divided_clocks = divided_clocks + 1;
endmodule 

module DE1_SoC_testbench();
  reg CLOCK_50, reset, clk; 
  wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
  wire [9:0] LEDR;
  wire [35:0] GPIO_0;
  reg  [3:0] KEY; // True when not pressed, False when pressed
  reg  [9:0] SW;
  
  DE1_SoC diss (.CLOCK_50(clk), .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW, .GPIO_0);

  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial clk=1;
  always begin
    #(CLOCK_PERIOD/2); clk = ~clk;
  end
  // Set up the inputs to the design (each line is a clock cycle)
  initial begin
    @(posedge clk); SW[9] <= 1; KEY[0]<=0;  
    @(posedge clk); SW[9] <= 0;
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); KEY[0] <= 1;
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); KEY[0] <= 0;
	 @(posedge clk); 
	 @(posedge clk); SW[9] <= 1;
	 @(posedge clk); SW[9] <= 0;
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); KEY[0] <= 1;
	 @(posedge clk); KEY[0] <= 0;
	 @(posedge clk); 
	 @(posedge clk); KEY[0] <= 1;
	 @(posedge clk); KEY[0] <= 0;
	 @(posedge clk); KEY[0] <= 1;
	 @(posedge clk); 
	 @(posedge clk); KEY[0] <= 1;
	 @(posedge clk); KEY[0] <= 0;
	 @(posedge clk); 
	 @(posedge clk); KEY[0] <= 1;
	 @(posedge clk); 
	 @(posedge clk); KEY[0] <= 0;
	 @(posedge clk); KEY[0] <= 1;
	 @(posedge clk); KEY[0] <= 0;
	 @(posedge clk); 
	 @(posedge clk); KEY[0] <= 1;
	 @(posedge clk); KEY[0] <= 0;
	 @(posedge clk); SW[9] <= 1;
	 @(posedge clk); SW[9] <= 0;
	 @(posedge clk); 
	 @(posedge clk); KEY[0] <= 1;
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); 
	 @(posedge clk); 
	 

	
	 $stop;        //End the simulation
  end
endmodule