`timescale 1 ns/10 ps

module top_to_segment_tb();
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
		
		//seven segment top module connection test 0
		s = 4'h0;
		#41.67;
        assert (seg == ~(7'b0111111))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);		
	
	//seven segment top module connection test 1
		s = 4'h1;
		#41.67;
        assert (seg == ~(7'b0000110))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 2
		s = 4'h2;
		#41.67;
        assert (seg == ~(7'b1011011))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 3
		s = 4'h3;
		#41.67;
        assert (seg == ~(7'b1001111))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 4
		s = 4'h4;
		#41.67;
        assert (seg == ~(7'b1100110))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 5
		s = 4'h5;
		#41.67;
        assert (seg == ~(7'b1101101))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 6
		s = 4'h6;
		#41.67;
        assert (seg == ~(7'b1111101))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 7
		s = 4'h7;
		#41.67;
        assert (seg == ~(7'b0000111))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 8
		s = 4'h8;
		#41.67;
        assert (seg == ~(7'b1111111))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 9
		s = 4'h9;
		#41.67;
        assert (seg == ~(7'b1101111))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 10
		s = 4'hA;
		#41.67;
        assert (seg == ~(7'b1110111))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 11
		s = 4'hB;
		#41.67;
        assert (seg == ~(7'b1111100))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 12
		s = 4'hC;
		#41.67;
        assert (seg == ~(7'b0111001))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 13
		s = 4'hD;
		#41.67;
        assert (seg == ~(7'b1011110))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 14
		s = 4'hE;
		#41.67;
        assert (seg == ~(7'b1111001))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);

	//seven segment top module connection test 15
		s = 4'hF;
		#41.67;
        assert (seg == ~(7'b1110001))
            $display("PASSED! The seven segment top module connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment top module connection behaves incorrectly at time: %0t.", $time);
		    
		#416.7 $stop;
	end
endmodule