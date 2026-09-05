`timescale 1 ns/10 ps

module top_to_counter_tb();
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
	
	//Top to counter connection test 3
	#250000000 //wait the full time for the default counter to activate again and then some
	reset = 0;
	#41.67 reset = 1;
	assert (led[2] == 0)
            $display("PASSED! The counter submodule connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter submodule connection behaves incorrectly at time: %0t.", $time);	

    #100000000 $stop;
  end
endmodule