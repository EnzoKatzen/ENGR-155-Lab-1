`timescale 1 ns/10 ps

module counter_tb();
	
	logic reset; //active low reset
	logic clk;	//clk for sim
	logic blink;		//1 output LED
	
	Counter #(
		.WIDTH(3),	//Smaller counter so test doesn't last forever
		.MAX(3'd3)	//Small max so test is faster - 3 so going over max does not cause overflow to reset it - only proper code can reset it
	) testCounter (
		.reset(reset),
		.clk(clk),
		.blink(blink)
	);
	
	always begin
		clk = 0; #10;
		clk = 1; #10;
	end
	
	initial begin
	//counter test 1 - confirming reset
		reset = 0;
		#10 reset = 1;
		assert (blink == 0)
            $display("PASSED! The counter submodule behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter submodule behaves incorrectly at time: %0t.", $time);
	
	//counter test 1 - confirming enable
		#10;
		#10;
		#10;
		#10;
		#10;
		#10;
		#10;

		assert (blink == 1)
            $display("PASSED! The counter submodule behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter submodule behaves incorrectly at time: %0t.", $time);

	//counter test 2 - confirming max
		#10;
		#10;
		#10;
		#10;
		#10;
		#10;
		#10;
		#10;

		assert (blink == 0)
            $display("PASSED! The counter submodule behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter submodule behaves incorrectly at time: %0t.", $time);
			
		//counter test 3 - confirming reset pt 1
		#10;
		#10;
		#10;
		#10;
		#10;
		#10;
		#10;
		#10;
		#10 reset = 0;
		#10 reset = 1;

		assert (blink == 0)
            $display("PASSED! The counter submodule behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter submodule behaves incorrectly at time: %0t.", $time);
	
	
		//counter test 3 - confirming reset pt 2
		#10;
		#10;
		#10;
		#10;
		#10;
		#10;
		#10;
		#10;

		assert (blink == 1)
            $display("PASSED! The counter submodule behaves as desired at time: %0t.", $time);
        else 
				$error("FAILED! The counter submodule behaves incorrectly at time: %0t.", $time);
		#50; $stop;
	end
endmodule