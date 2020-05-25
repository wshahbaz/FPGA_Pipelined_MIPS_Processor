`timescale 1 ps / 100 fs
// Stall Control 
module StallControl(PC_WriteEn,IFID_WriteEn,Stall_flush,EX_MemRead,EX_rt,ID_rs,ID_rt,ID_Op);
output PC_WriteEn,IFID_WriteEn,Stall_flush;
wire PC_WriteEn,IFID_WriteEn,Stall_flush;
input EX_MemRead,EX_rt,ID_rs,ID_rt;
input [5:0] ID_Op;
wire [4:0] EX_rt,ID_rs,ID_rt,xorRsRt,xorRtRt;
wire [5:0] xoropcodelw,xoropcodexori;
wire EX_MemRead;
//wire xoropcode1,xoroprt;
// write in behavior model
/*always @(EX_MemRead or EX_rt or ID_rs or ID_rt)
begin
 if ((EX_MemRead==1)&&((EX_rt==ID_rs)||((EX_rt==ID_rt)&&(Opcode!= 6'b001110)&&(Opcode!= 6'b100011)))
  begin
  PC_WriteEn=1'b0;
  IFID_WriteEn=1'b0;
  Stall_flush =1'b1;
  end
  else
  begin
  PC_WriteEn=1'b1;
  IFID_WriteEn=1'b1;
  Stall_flush =1'b0;
  end
end
*/
// write in structural model
xor #(50) xorRsRt4(xorRsRt[4],EX_rt[4],ID_rs[4]);
xor #(50) xorRsRt3(xorRsRt[3],EX_rt[3],ID_rs[3]);
xor #(50) xorRsRt2(xorRsRt[2],EX_rt[2],ID_rs[2]);
xor #(50) xorRsRt1(xorRsRt[1],EX_rt[1],ID_rs[1]);
xor #(50) xorRsRt0(xorRsRt[0],EX_rt[0],ID_rs[0]);
or #(50) OrRsRt1(OrRsRt,xorRsRt[4],xorRsRt[3],xorRsRt[2],xorRsRt[1],xorRsRt[0]);
not #(50) notgate1(notOrRsRt,OrRsRt);
// id EX_rt==ID_rs then notOrRsRt = 1

xor #(50) xorRtRt4(xorRtRt[4],EX_rt[4],ID_rt[4]);
xor #(50) xorRtRt3(xorRtRt[3],EX_rt[3],ID_rt[3]);
xor #(50) xorRtRt2(xorRtRt[2],EX_rt[2],ID_rt[2]);
xor #(50) xorRtRt1(xorRtRt[1],EX_rt[1],ID_rt[1]);
xor #(50) xorRtRt0(xorRtRt[0],EX_rt[0],ID_rt[0]);
or #(50) OrRtRt1(OrRtRt,xorRtRt[4],xorRtRt[3],xorRtRt[2],xorRtRt[1],xorRtRt[0]);
not #(50) notgate2(notOrRtRt,OrRtRt);
// if EX_rt==ID_rt then notOrRtRt = 1
xor #(50) xoropcode5(xoropcodelw[5],ID_Op[5],1'b1);
xor #(50) xoropcode4(xoropcodelw[4],ID_Op[4],1'b0);
xor #(50) xoropcode3(xoropcodelw[3],ID_Op[3],1'b0);
xor #(50) xoropcode2(xoropcodelw[2],ID_Op[2],1'b0);
xor #(50) xoropcode1(xoropcodelw[1],ID_Op[1],1'b1);
xor #(50) xoropcode0(xoropcodelw[0],ID_Op[0],1'b1);
or #(50) oropcode1(ec1,xoropcodelw[5],xoropcodelw[4],xoropcodelw[3],xoropcodelw[2],xoropcodelw[1],xoropcodelw[0]);
// opcode != opcode[lw] xoropcodelw =1
xor #(50) xoropcod5(xoropcodexori[5],ID_Op[5],1'b0);
xor #(50) xoropcod4(xoropcodexori[4],ID_Op[4],1'b0);
xor #(50) xoropcod3(xoropcodexori[3],ID_Op[3],1'b1);
xor #(50) xoropcod2(xoropcodexori[2],ID_Op[2],1'b1);
xor #(50) xoropcod1(xoropcodexori[1],ID_Op[1],1'b1);
xor #(50) xoropcod0(xoropcodexori[0],ID_Op[0],1'b0);
or #(50) oropcode2(ec2,xoropcodexori[5],xoropcodexori[4],xoropcodexori[3],xoropcodexori[2],xoropcodexori[1],xoropcodexori[0]);
// opcode != opcode[xori] xoropcodexori =1

and #(50) and1(xorop,ec1,ec2);
and #(50) and2(xoroprt,xorop,notOrRtRt);
or #(50) OrEXIDRsRt(OrOut,notOrRsRt,xoroprt);
and #(50) AndCondition(Condition,EX_MemRead,OrOut);
// Condition =1 when stall is satisfied
not #(50) NotPC_WriteEn(PC_WriteEn,Condition);
not #(50) NotIFID_WriteEn(IFID_WriteEn,Condition);
buf #(50) bufStallflush(Stall_flush,Condition);
endmodule