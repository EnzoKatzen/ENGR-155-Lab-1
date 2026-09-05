`timescale 1 ns/10 ps

module segment_tb();
	logic [3:0] bitsIn;		//4 bit input switches
	logic [6:0] diodeSeg;		//7 output segments
	
	sevenSeg segments (
        .bitsIn(bitsIn),
		.diodeSeg(diodeSeg)
    );
	
	initial begin
		//seven segment display test 0
		bitsIn = 4'h0;
		#41.67;
        assert (diodeSeg == ~(7'b0111111))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);		
	
	//seven segment display test 1
		bitsIn = 4'h1;
		#41.67;
        assert (diodeSeg == ~(7'b0000110))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 2
		bitsIn = 4'h2;
		#41.67;
        assert (diodeSeg == ~(7'b1011011))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 3
		bitsIn = 4'h3;
		#41.67;
        assert (diodeSeg == ~(7'b1001111))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 4
		bitsIn = 4'h4;
		#41.67;
        assert (diodeSeg == ~(7'b1100110))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 5
		bitsIn = 4'h5;
		#41.67;
        assert (diodeSeg == ~(7'b1101101))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 6
		bitsIn = 4'h6;
		#41.67;
        assert (diodeSeg == ~(7'b1111101))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 7
		bitsIn = 4'h7;
		#41.67;
        assert (diodeSeg == ~(7'b0000111))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 8
		bitsIn = 4'h8;
		#41.67;
        assert (diodeSeg == ~(7'b1111111))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 9
		bitsIn = 4'h9;
		#41.67;
        assert (diodeSeg == ~(7'b1101111))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 10
		bitsIn = 4'hA;
		#41.67;
        assert (diodeSeg == ~(7'b1110111))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 11
		bitsIn = 4'hB;
		#41.67;
        assert (diodeSeg == ~(7'b1111100))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 12
		bitsIn = 4'hC;
		#41.67;
        assert (diodeSeg == ~(7'b0111001))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 13
		bitsIn = 4'hD;
		#41.67;
        assert (diodeSeg == ~(7'b1011110))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 14
		bitsIn = 4'hE;
		#41.67;
        assert (diodeSeg == ~(7'b1111001))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);

	//seven segment display test 15
		bitsIn = 4'hF;
		#41.67;
        assert (diodeSeg == ~(7'b1110001))
            $display("PASSED! The seven segment display controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segment display controller behaves incorrectly at time: %0t.", $time);
		
		#416.7 $stop;
	end
endmodule