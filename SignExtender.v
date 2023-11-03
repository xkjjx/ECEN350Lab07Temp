module SignExtender(BusImm, Imm26, Ctrl); 
   output reg [63:0] BusImm; 
   input [25:0]  Imm26; 
   input [1:0]	 Ctrl; 
   
   always @(*) begin
    case(Ctrl)
     2'b00: BusImm = {{55{Imm26[20]}}, Imm26[20:12]};
     2'b01: BusImm = {{52{Imm26[21]}}, Imm26[21:10]};
     2'b10: BusImm = {{45{Imm26[23]}}, Imm26[23:5]};
     2'b11: BusImm = {{38{Imm26[25]}}, Imm26[25:0]};
     default:
	BusImm = 64'b0;
    endcase
   end
	
	endmodule
