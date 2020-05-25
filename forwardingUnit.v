`timescale 1 ps / 100 fs
// Forwarding Unit
module ForwardingUnit(ForwardA,ForwardB,MEM_RegWrite,WB_RegWrite,MEM_WriteRegister,WB_WriteRegister,EX_rs,EX_rt);
output [1:0] ForwardA,ForwardB;
wire [1:0] ForwardA,ForwardB;
input MEM_RegWrite,WB_RegWrite;
input [4:0] MEM_WriteRegister,WB_WriteRegister,EX_rs,EX_rt;

// a= 1 if ( MEM_WriteRegister != 0 )
or #(50) orMEM_WriteReg(a,MEM_WriteRegister[4],MEM_WriteRegister[3],MEM_WriteRegister[2],MEM_WriteRegister[1],MEM_WriteRegister[0]);
CompareAddress CompMEM_WriteReg_EXrs(b,MEM_WriteRegister,EX_rs);
and #(50) andx(x,MEM_RegWrite,a,b);
// x=1 if ((MEM_RegWrite==1)&&(MEM_WriteRegister != 0)&&(MEM_WriteRegister==EX_rs))

// c= 1 if ( WB_WriteRegister != 0 )
or #(50) orWB_WriteReg(c,WB_WriteRegister[4],WB_WriteRegister[3],WB_WriteRegister[2],WB_WriteRegister[1],WB_WriteRegister[0]);
CompareAddress CompWB_WriteReg_EXrs(d,WB_WriteRegister,EX_rs);
and #(50) andy(y,WB_RegWrite,c,d);
// y=1 if ((WB_RegWrite==1)&&(WB_WriteRegister != 0)&&(WB_WriteRegister==EX_rs))

// ForwardA[1] = x; va ForwardA[0] = (NOT x). y ;
assign ForwardA[1] = x;
not #(50) notxgate(notx,x);
and #(50) NOTxANDy(ForwardA[0],notx,y);

// ForwardB 
CompareAddress CompMEM_WriteReg_EXrt(b1,MEM_WriteRegister,EX_rt);
CompareAddress CompWB_WriteReg_EXrt(d1,WB_WriteRegister,EX_rt);
and #(50) andx1(x1,MEM_RegWrite,a,b1);
and #(50) andy1(y1,WB_RegWrite,c,d1);

assign ForwardB[1] = x1;
not #(50) notx1gate(notx1,x1);
and #(50) NOTx1ANDy1(ForwardB[0],notx1,y1);
endmodule