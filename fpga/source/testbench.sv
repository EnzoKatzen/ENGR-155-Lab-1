//Author: Enzo Katzen - ekatzen@hmc.edu
//Date: 9/2/2026
//Purpose: Tests the lab1_EK.sv and its
//		   associated submodules (sevenSeg.sv
//		   and LEDCounter.sv).

`timescale 1 ns/10 ps

module toplevel_tb();
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
			
    #416.7 $stop;
  end
endmodule