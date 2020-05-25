`timescale 1 ps / 100 fs
// Write Back Forwarding 
module WB_forward(ReadData1Out,ReadData2Out,ReadData1,ReadData2,rs,rt,WriteRegister,WriteData,RegWrite);
// WB Hazard: Reading data while writing 
// Solve Hazard at the WriteBack Stage
output [31:0] ReadData1Out,ReadData2Out;
input [31:0] ReadData1,ReadData2,WriteData;
input [4:0] rs,rt,WriteRegister;
input RegWrite;
wire ReadSourceRs,ReadSourceRt;
wire compOut1,compOut2;
// behavior model
/*
always @(rs or rt or WriteRegister or WriteData or RegWrite)
begin
 if ((RegWrite==1)&&(WriteRegister != 0)&&(WriteRegister==rs))
  ReadSourceRs = 1'b1; //Forwarding WriteData to ReadData1
  else 
  ReadSourceRs = 1'b0;
  if ((RegWrite==1)&&(WriteRegister != 0)&&(WriteRegister==rt))
  ReadSourceRt = 1'b1; //Forwarding WriteData to ReadData2
  else 
  ReadSourceRt = 1'b0;
end
*/
// Structural model
or #(50) orWriteReg(orOut1,WriteRegister[4],WriteRegister[3],WriteRegister[2],WriteRegister[1],WriteRegister[0]);
CompareAddress Compare1(compOut1,WriteRegister,rs);
and #(50) andCondition1(ReadSourceRs,RegWrite,orOut1,compOut1);

CompareAddress Compare2(compOut2,WriteRegister,rt);
and #(50) andCondition2(ReadSourceRt,RegWrite,orOut1,compOut2);

mux2x32to32 muxReadData1( ReadData1Out,ReadData1,WriteData, ReadSourceRs);
mux2x32to32 muxReadData2( ReadData2Out,ReadData2,WriteData, ReadSourceRt);
endmodule
`timescale 1 ps / 100 fs

// Compare Address
module CompareAddress(equal,Addr1,Addr2);
output equal;
wire equal;
input [4:0] Addr1,Addr2;
wire [4:0] Addr1,Addr2,xorAddress;
xor #(50) xorAddress4(xorAddress[4],Addr1[4],Addr2[4]);
xor #(50) xorAddress3(xorAddress[3],Addr1[3],Addr2[3]);
xor #(50) xorAddress2(xorAddress[2],Addr1[2],Addr2[2]);
xor #(50) xorAddress1(xorAddress[1],Addr1[1],Addr2[1]);
xor #(50) xorAddress0(xorAddress[0],Addr1[0],Addr2[0]);
or #(50) Orgate1(OrAddr,xorAddress[4],xorAddress[3],xorAddress[2],xorAddress[1],xorAddress[0]);
not #(50) notgate1(equal,OrAddr);
endmodule