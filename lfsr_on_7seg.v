module lfsr_on_7seg (
    input clk, 
	 input reset,
    input [15:0] SEED,   // User-defined seed
	 output wire [15:0] LED,
    output wire [6:0] seg1,   // 7-segment for LFSR[15:12]
    output wire [6:0] seg2,   // 7-segment for LFSR[11:8]
    output wire [6:0] seg3,   // 7-segment for LFSR[7:4]
    output wire [6:0] seg4    // 7-segment for LFSR[3:0]
);
    wire [15:0] lfsr;

    // Instantiate the LFSR module
    lfsr_16bit lfsr_inst (clk,reset,SEED,lfsr);

	 assign LED = SEED;
	 
    // Extract 4-bit hex values
    wire [3:0] hex1 = lfsr[15:12];
    wire [3:0] hex2 = lfsr[11:8];
    wire [3:0] hex3 = lfsr[7:4];
    wire [3:0] hex4 = lfsr[3:0];

    // Convert hex to 7-segment
    hex2_7seg seg_inst1 (hex1,seg1);
    hex2_7seg seg_inst2 (hex2,seg2);
    hex2_7seg seg_inst3 (hex3,seg3);
    hex2_7seg seg_inst4 (hex4,seg4);

endmodule
