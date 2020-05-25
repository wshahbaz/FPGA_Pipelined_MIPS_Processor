// Flush control signals 
`timescale 1 ps / 100 fs
module flush_block(
ID_RegDst,ID_ALUSrc, ID_MemtoReg,ID_RegWrite,ID_MemRead,ID_MemWrite,
ID_Branch,ID_ALUOp,ID_JRControl,flush,RegDst,ALUSrc,MemtoReg,RegWrite,
MemRead,MemWrite,Branch,ALUOp,JRControl);

output ID_RegDst,ID_ALUSrc,ID_MemtoReg,ID_RegWrite,ID_MemRead,ID_MemWrite,ID_Branch,ID_JRControl;
output [1:0] ID_ALUOp;
input flush,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,JRControl;
input [1:0] ALUOp;

not #50 (notflush,flush);
and #50 and1(ID_RegDst,RegDst,notflush);
and #50 and2(ID_ALUSrc,ALUSrc,notflush);
and #50 and3(ID_MemtoReg,MemtoReg,notflush);
and #50 and4(ID_RegWrite,RegWrite,notflush);
and #50 and5(ID_MemRead,MemRead,notflush);
and #50 and6(ID_MemWrite,MemWrite,notflush);
and #50 and7(ID_Branch,Branch,notflush);
and #50 and8(ID_JRControl,JRControl,notflush);
and #50 and9(ID_ALUOp[1],ALUOp[1],notflush);
and #50 and10(ID_ALUOp[0],ALUOp[0],notflush);
endmodule
`timescale 1 ps / 100 fs

// Discard instructions when needed
module Discard_Instr(ID_flush,IF_flush,jump,bne,jr);
output ID_flush,IF_flush;
input jump,bne,jr;
or #50 OR1(IF_flush,jump,bne,jr);
or #50 OR2(ID_flush,bne,jr);
endmodule