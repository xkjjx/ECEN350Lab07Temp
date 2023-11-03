`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:02:47 03/05/2009
// Design Name:   ALU
// Module Name:   E:/350/Lab8/ALU/ALUTest.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define STRLEN 32
module ALUTest_v;

	task passTest;
		input [64:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: %x should be %x", testType, actualOut, expectedOut);
	endtask
	
	task allPassed;
		input [7:0] passed;
		input [7:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed");
	endtask

	// Inputs
	reg [63:0] BusA;
	reg [63:0] BusB;
	reg [3:0] ALUCtrl;
	reg [7:0] passed;

	// Outputs
	wire [63:0] BusW;
	wire Zero;
    initial
    begin
    $dumpfile("alutest.vcd");
    $dumpvars(0,ALUTest_v);
    end
	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.BusW(BusW), 
		.Zero(Zero), 
		.BusA(BusA), 
		.BusB(BusB), 
		.ALUCtrl(ALUCtrl)
	);

	initial begin
		// Initialize Inputs
		BusA = 0;
		BusB = 0;
		ALUCtrl = 0;
		passed = 0;

                // Here is one example test vector, testing the ADD instruction:
		{BusA, BusB, ALUCtrl} = {64'h1234, 64'hABCD0000, 4'h2}; #40; passTest({Zero, BusW}, 65'h0ABCD1234, "ADD 0x1234,0xABCD0000", passed);
		{BusA, BusB, ALUCtrl} = {64'hABABABAB, 64'hCDCDCDCD, 4'h2}; #40; passTest({Zero, BusW}, 65'h179797978, "ADD 0xABABABAB,0xCDCDCDCD", passed);
		{BusA, BusB, ALUCtrl} = {64'hBDEF7263, 64'hECAB6234, 4'h2}; #40; passTest({Zero, BusW}, 65'h1AA9AD497, "ADD 0xBDEF7263,0xECAB6234", passed);
		{BusA, BusB, ALUCtrl} = {64'hFFFFFFFF, 64'h00000000, 4'h0}; #40; passTest({Zero, BusW}, 65'h10000000000000000, "AND 0xFFFFFFFF,0x0", passed);
		{BusA, BusB, ALUCtrl} = {64'hFFFFFFFF, 64'hFFFFFFFF, 4'h0}; #40; passTest({Zero, BusW}, 65'hFFFFFFFF, "AND 0x1234,0xABCD0000", passed);
		{BusA, BusB, ALUCtrl} = {64'hABCDEF01, 64'hFEDCBA98, 4'h0}; #40; passTest({Zero, BusW}, 65'hAACCAA00, "AND 0xABCDEF01,0xFEDCBA98", passed);
		{BusA, BusB, ALUCtrl} = {64'hFFFFFFFF, 64'hFFFFFFFF, 4'h6}; #40; passTest({Zero, BusW}, 65'h10000000000000000, "SUB 0xFFFFFFFF,0xFFFFFFFF", passed);
		{BusA, BusB, ALUCtrl} = {64'h80000001, 64'h7FFFFFFF, 4'h6}; #40; passTest({Zero, BusW}, 65'h2, "SUB 0x80000001,0x7FFFFFFF", passed);
		{BusA, BusB, ALUCtrl} = {64'h98765432, 64'h12345678, 4'h6}; #40; passTest({Zero, BusW}, 65'h8641FDBA, "SUB 0x98765432,0x12345678", passed);
		{BusA, BusB, ALUCtrl} = {64'hFFFFFFFF, 64'hFFFFFFFF, 4'h1}; #40; passTest({Zero, BusW}, 65'hFFFFFFFF, "OR 0xFFFFFFFF,0xFFFFFFFF", passed);
		{BusA, BusB, ALUCtrl} = {64'h1234, 64'hABCD0000, 4'h1}; #40; passTest({Zero, BusW}, 65'h0ABCD1234, "OR 0x1234,0xABCD0000", passed);
		{BusA, BusB, ALUCtrl} = {64'hAABBCCDD, 64'hBBAADDCC, 4'h1}; #40; passTest({Zero, BusW}, 65'h0BBBBDDDD, "OR 0xAABBCCDD,0cBBAADDCC", passed);
		{BusA, BusB, ALUCtrl} = {64'h1234, 64'hABCD0000, 4'h7}; #40; passTest({Zero, BusW}, 65'h0ABCD0000, "PASSB 0x1234,0xABCD0000", passed);
		{BusA, BusB, ALUCtrl} = {64'hABABABAB, 64'hFFFFFFFF, 4'h7}; #40; passTest({Zero, BusW}, 65'hFFFFFFFF, "PASSB 0xABABABAB,0xFFFFFFFF", passed);
		{BusA, BusB, ALUCtrl} = {64'h87654321, 64'hABCDEF01, 4'h7}; #40; passTest({Zero, BusW}, 65'hABCDEF01, "PASSB 0x987654321,0xABCDEF01", passed);



		allPassed(passed, 15);
	end
      
endmodule

