//Author: Enzo Katzen - ekatzen@hmc.edu
//Date: 9/2/2026
//Purpose: Tests the lab1_EK.sv and its
//		   associated submodules (sevenSeg.sv
//		   and LEDCounter.sv).

`timescale 1 ns/10 ps

module lab1_tb();
	logic           reset;  // active low reset
	logic 			clk;	// clk for sim
	logic   [3:0]   s;      // 4-bit input switches
	logic   [2:0]   led;    // 3 output LEDs
	logic 	[6:0]	seg;	// 7 output segments

    lab1_EK dut (
		.reset(reset),
        .s(s),
		.clk(clk),
        .led(led),
		.seg(seg)
    );

	//test the seven segment display
	logic [4:0] bitsIn;		//4 bit input switches
	logic [6:0] LEDSeg;		//7 output segments
	
	sevenSeg segments (
        .bitsIn(bitsIn),
		.LEDSeg(LEDSeg)
    );
	
	
	//test the counter
	logic counterReset; //active low reset
	logic counterClk;	//clk for sim
	logic blinkLED;		//1 output LED
	
	LEDCounter #(
		.WIDTH(3),	//Smaller counter so test doesn't last forever
		.MAX(3'd3)	//Small max so test is faster - 3 so going over max does not cause overflow to reset it - only proper code can reset it
	) testCounter (
		.reset(counterReset),
		.clk(counterClk),
		.blinkLED(blinkLED)
	);

  // apply stimuli and check outputs
	initial begin
		reset = 0;
		#41.67 reset = 1;

    // for each test case we setup the inputs, wait for the outputs to update,
    // and then check that the outputs match what we expect using `assert`
    // in this case, the leds use combinational logic, so we don't *need* to wait
    // a full clock cycle (#41.67) (1s/24MHz = 41.67 ns)
	
	//clk test 1
		assert (clk == 0)
	        $display("PASSED! The HSOSC generated clk behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The HSOSC generated clk behaves incorrectly at time: %0t.", $time); 
		#20.83;
	//clk test 2
		assert (clk == 1)
	        $display("PASSED! The HSOSC generated clk behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The HSOSC generated clk behaves incorrectly at time: %0t.", $time); 
		#20.83;

    //led[0] test 1
        s = 4'b0000;                // setup inputs
        #41.67;                        // wait required time
        assert (led == 3'b00)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
            
    //led[0] test 2
        s = 4'b0001;
        #41.67;
        assert (led == 3'b01)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
        
    //led[0] test 3
        s = 4'b0010;
        #41.67;
        assert (led == 3'b01)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 

    //led[0] test 4
        s = 4'b0011;
        #41.67;
        assert (led == 3'b00)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
			
    //led[1] test 1
        s = 4'b0100;
        #41.67;
        assert (led == 3'b00)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 

	//led[1] test 2
        s = 4'b1000;
        #41.67;
        assert (led == 3'b00)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
	//led[1] test 3
        s = 4'b1100;
        #41.67;
        assert (led == 3'b10)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 

	//combo test 1
        s = 4'b1101;
        #41.67;
        assert (led == 3'b11)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time);
			
	//combo test 2
        s = 4'b1111;
        #41.67;
        assert (led == 3'b10)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
			
	//combo test 3
        s = 4'b0101;
        #41.67;
        assert (led == 3'b01)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time);
			
	//----------------------------------------------------------------------------------------------------//
	//Now checking the seven segment module
	
	//seven segment display test 0
		bitsIn = 4'h0;
		#41.67;
        assert (LEDSeg == ~(7'b0111111))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);		
	
	//seven segment display test 1
		bitsIn = 4'h1;
		#41.67;
        assert (LEDSeg == ~(7'b0000110))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 2
		bitsIn = 4'h2;
		#41.67;
        assert (LEDSeg == ~(7'b1011011))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 3
		bitsIn = 4'h3;
		#41.67;
        assert (LEDSeg == ~(7'b1001111))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 4
		bitsIn = 4'h4;
		#41.67;
        assert (LEDSeg == ~(7'b1100110))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 5
		bitsIn = 4'h5;
		#41.67;
        assert (LEDSeg == ~(7'b1101101))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 6
		bitsIn = 4'h6;
		#41.67;
        assert (LEDSeg == ~(7'b1111101))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 7
		bitsIn = 4'h7;
		#41.67;
        assert (LEDSeg == ~(7'b0000111))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 8
		bitsIn = 4'h8;
		#41.67;
        assert (LEDSeg == ~(7'b1111111))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 9
		bitsIn = 4'h9;
		#41.67;
        assert (LEDSeg == ~(7'b1101111))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 10
		bitsIn = 4'hA;
		#41.67;
        assert (LEDSeg == ~(7'b1110111))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 11
		bitsIn = 4'hB;
		#41.67;
        assert (LEDSeg == ~(7'b1111100))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 12
		bitsIn = 4'hC;
		#41.67;
        assert (LEDSeg == ~(7'b0111001))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 13
		bitsIn = 4'hD;
		#41.67;
        assert (LEDSeg == ~(7'b1011110))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 14
		bitsIn = 4'hE;
		#41.67;
        assert (LEDSeg == ~(7'b1111001))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 15
		bitsIn = 4'hF;
		#41.67;
        assert (LEDSeg == ~(7'b1110001))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);
	
	//----------------------------------------------------------------------------------------------------//
	//Now checking the top modules connection with the seven segment submodule
	
	//top to seven segment connection test 1
		s = 4'h0;
		#41.67;
        assert (seg == ~(7'b0111111))
            $display("PASSED! The seven segment submodule connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);
			
	//top to seven segment connection test 2
		s = 4'hF;
		#41.67;
        assert (seg == ~(7'b1110001))
            $display("PASSED! The seven segment submodule connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);
			
	//----------------------------------------------------------------------------------------------------//
	//Now checking the counter submodule
	
	//counter test 1 - confirming reset
		counterReset = 0;
		#10 counterReset = 1;
		assert (blinkLED == 0)
            $display("PASSED! The counter submodule behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter submodule behaves incorrectly at time: %0t.", $time);
	
	//counter test 1 - confirming enable
		counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10;

		assert (blinkLED == 1)
            $display("PASSED! The counter submodule behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter submodule behaves incorrectly at time: %0t.", $time);

	//counter test 2 - confirming max
		counterClk = 0;
		#10 counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10;

		assert (blinkLED == 0)
            $display("PASSED! The counter submodule behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter submodule behaves incorrectly at time: %0t.", $time);
			
		//counter test 3 - confirming reset pt 1
		counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10 counterReset = 0;
		counterClk = 0;
		#10 counterReset = 1;

		assert (blinkLED == 0)
            $display("PASSED! The counter submodule behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter submodule behaves incorrectly at time: %0t.", $time);
	
	
		//counter test 3 - confirming reset pt 2
		counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10 counterClk = 0;
		#10 counterClk = 1;
		#10;

		assert (blinkLED == 1)
            $display("PASSED! The counter submodule behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter submodule behaves incorrectly at time: %0t.", $time);
			
	//----------------------------------------------------------------------------------------------------//
	//Now checking the top modules connection with the counter submodule
	
	//Top to counter connection test 1
	#208333334 //wait the full time for the default counter to activate
	assert (led[2] == 1)
            $display("PASSED! The counter submodule connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter submodule connection behaves incorrectly at time: %0t.", $time);

	//Top to counter connection test 2
	#208333334 //wait the full time for the default counter to deactivate
	assert (led[2] == 0)
            $display("PASSED! The counter submodule connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter submodule connection behaves incorrectly at time: %0t.", $time);	

    #416.7 $stop;
  end
endmodule