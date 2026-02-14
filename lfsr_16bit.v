module lfsr_16bit (
    input clk,              		 // clock input
    input reset,             		 // reset input
    input [15:0] SEED, 				 // SEED value as an input by user
    output reg [15:0] lfsr        // Output of the LFSR
	 );

    // Feedback based on the polynomial x^16 + x^15 + x^13 + x^4 + 1
    wire feedback;
    assign feedback = lfsr[15] ^ lfsr[14] ^ lfsr[12] ^ lfsr[3];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Initialize the LFSR with the user-provided state(SEED value) or set to a default state(0001H)
            if (SEED == 16'b0)
                lfsr <= 16'b0000_0000_0000_0001; // Default to a valid non-zero state
            else
                lfsr <= SEED;
        end 
		  
		  else 
		  begin
            // Update the LFSR
            lfsr <= {feedback, lfsr[15:1]}; // Shift right and insert the feedback bit
        end
    end
endmodule 