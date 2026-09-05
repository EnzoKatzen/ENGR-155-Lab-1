//Author: Enzo Katzen - ekatzen@hmc.edu
//Date: 9/2/2026
//Purpose: Uses combinational logic to turn on LEDs
//		   on the uPs Dev Board based on the state
//		   of SW6. It also uses the state of SW6
//		   to set a 7 segment display.


module lab1_EK(
	input logic [3:0] s,
	input logic reset,
	output logic clk,	//For testing
	output logic [2:0] led,
	output logic [6:0] seg
);

	//Using template from iCE40 Oscillator Usage Guide
	HSOSC 
	#(
		.CLKHF_DIV ("0b01") //Setting this to 1 divides the frequency by two, setting it to 24 MHz so math is easier
	) OSCInst0 (
		.CLKHFPU(1'b1), 
		.CLKHFEN(1'b1), 
		.CLKHF(clk) //Setting clk to be the 24 MHz signal
	);
	
	Counter blink(
		.clk(clk),
		.reset(reset),
		.blink(led[2])
		);
		
	//led[0] equates to a XOR of switches 0 and 1
	assign led[0] = s[0] ^ s[1];
	//led[1] equates to an AND of switches 2 and 3
	assign led[1] = s[2] && s[3];
	
	sevenSeg segments(
		.bitsIn(s),
		.diodeSeg(seg)
		);
	
endmodule	