module SignExtenderTest;

reg [25:0] Imm26;
reg [1:0] Ctrl;
wire [63:0] BusImm;

SignExtender dut(
	.BusImm(BusImm),
	.Imm26(Imm26),
	.Ctrl(Ctrl)
	
);

	initial begin
		//3 TESTS D Format

		Imm26 = 26'b00000110010111000000000000;
		Ctrl = 2'b00;
		#10
		$display("At time %t, Imm26 = %b, Ctrl = %b, BusImm = %b", $time, Imm26, Ctrl, BusImm);
		if (BusImm !== 64'b1111111111111111111111111111111111111111111111111111111110010111) $display("Test Case 1 failed");
		else $display("Test Case 1 passed");

		Imm26 = 26'b00000000111101000000000000;
		Ctrl = 2'b00;
		#10
		$display("At time %t, Imm26 = %b, Ctrl = %b, BusImm = %b", $time, Imm26, Ctrl, BusImm);
		if (BusImm !== 64'b0000000000000000000000000000000000000000000000000000000000111101) $display("Test Case 2 failed");
		else $display("Test Case 2 passed");

		Imm26 = 26'b00000100000001000000000000;
		Ctrl = 2'b00;
		#10
		$display("At time %t, Imm26 = %b, Ctrl = %b, BusImm = %b", $time, Imm26, Ctrl, BusImm);
		if (BusImm !== 64'b1111111111111111111111111111111111111111111111111111111100000001) $display("Test Case 3 failed");
		else $display("Test Case 3 passed");

		//3 TESTS I Format

		Imm26 = 26'b00001001100111010000000000;
		Ctrl = 2'b01;
		#10
		$display("At time %t, Imm26 = %b, Ctrl = %b, BusImm = %b", $time, Imm26, Ctrl, BusImm);
		if (BusImm !== 64'b1111111111111111111111111111111111111111111111111111100110011101) $display("Test Case 4 failed");
		else $display("Test Case 4 passed");

		Imm26 = 26'b00000001111110010000000000;
		Ctrl = 2'b01;
		#10
		$display("At time %t, Imm26 = %b, Ctrl = %b, BusImm = %b", $time, Imm26, Ctrl, BusImm);
		if (BusImm !== 64'b0000000000000000000000000000000000000000000000000000000111111001) $display("Test Case 5 failed");
		else $display("Test Case 5 passed");

		Imm26 = 26'b00001000000000000000000000;
		Ctrl = 2'b01;
		#10
		$display("At time %t, Imm26 = %b, Ctrl = %b, BusImm = %b", $time, Imm26, Ctrl, BusImm);
		if (BusImm !== 64'b1111111111111111111111111111111111111111111111111111100000000000) $display("Test Case 6 failed");
		else $display("Test Case 6 passed");

		//3 TESTS CBZ Format

		Imm26 = 26'b00011111111111111111100000;
		Ctrl = 2'b10;
		#10
		$display("At time %t, Imm26 = %b, Ctrl = %b, BusImm = %b", $time, Imm26, Ctrl, BusImm);
		if (BusImm !== 64'b0000000000000000000000000000000000000000000000111111111111111111) $display("Test Case 7 failed");
		else $display("Test Case 7 passed");

		Imm26 = 26'b00100011101011001101100000;
		Ctrl = 2'b10;
		#10
		$display("At time %t, Imm26 = %b, Ctrl = %b, BusImm = %b", $time, Imm26, Ctrl, BusImm);
		if (BusImm !== 64'b1111111111111111111111111111111111111111111111000111010110011011) $display("Test Case 8 failed");
		else $display("Test Case 8 passed");

		Imm26 = 26'b00001010101010101010100000;
		Ctrl = 2'b10;
		#10
		$display("At time %t, Imm26 = %b, Ctrl = %b, BusImm = %b", $time, Imm26, Ctrl, BusImm);
		if (BusImm !== 64'b0000000000000000000000000000000000000000000000010101010101010101) $display("Test Case 9 failed");
		else $display("Test Case 9 passed");

		//3 TESTS B Format

		Imm26 = 26'b01111110110011100110010100;
		Ctrl = 2'b11;
		#10
		$display("At time %t, Imm26 = %b, Ctrl = %b, BusImm = %b", $time, Imm26, Ctrl, BusImm);
		if (BusImm !== 64'b0000000000000000000000000000000000000001111110110011100110010100) $display("Test Case 10 failed");
		else $display("Test Case 10 passed");

		Imm26 = 26'b11111111111111111111111111;
		Ctrl = 2'b11;
		#10
		$display("At time %t, Imm26 = %b, Ctrl = %b, BusImm = %b", $time, Imm26, Ctrl, BusImm);
		if (BusImm !== 64'b1111111111111111111111111111111111111111111111111111111111111111) $display("Test Case 11 failed");
		else $display("Test Case 11 passed");

		Imm26 = 26'b10000000000000000000000000;
		Ctrl = 2'b11;
		#10
		$display("At time %t, Imm26 = %b, Ctrl = %b, BusImm = %b", $time, Imm26, Ctrl, BusImm);
		if (BusImm !== 64'b1111111111111111111111111111111111111110000000000000000000000000) $display("Test Case 12 failed");
		else $display("Test Case 12 passed");
		$finish;
	end
endmodule
