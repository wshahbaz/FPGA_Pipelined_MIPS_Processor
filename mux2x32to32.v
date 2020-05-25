`timescale 1 ps / 100 fs
// mux2x32to32
//used for choosing bus B for ALU
module mux2x32to32( DataOut,Data0, Data1, Select);
output [31:0] DataOut; // Data Out
input [31:0] Data0, Data1; // Data In 1 and 2
input Select;

mux2_1 mux0(DataOut[0],Data0[0],Data1[0],Select);
mux2_1 mux1(DataOut[1],Data0[1],Data1[1],Select);
mux2_1 mux2(DataOut[2],Data0[2],Data1[2],Select);
mux2_1 mux3(DataOut[3],Data0[3],Data1[3],Select);
mux2_1 mux4(DataOut[4],Data0[4],Data1[4],Select);
mux2_1 mux5(DataOut[5],Data0[5],Data1[5],Select);
mux2_1 mux6(DataOut[6],Data0[6],Data1[6],Select);
mux2_1 mux7(DataOut[7],Data0[7],Data1[7],Select);
mux2_1 mux8(DataOut[8],Data0[8],Data1[8],Select);
mux2_1 mux9(DataOut[9],Data0[9],Data1[9],Select);
mux2_1 mux10(DataOut[10],Data0[10],Data1[10],Select);
mux2_1 mux11(DataOut[11],Data0[11],Data1[11],Select);
mux2_1 mux12(DataOut[12],Data0[12],Data1[12],Select);
mux2_1 mux13(DataOut[13],Data0[13],Data1[13],Select);
mux2_1 mux14(DataOut[14],Data0[14],Data1[14],Select);
mux2_1 mux15(DataOut[15],Data0[15],Data1[15],Select);
mux2_1 mux16(DataOut[16],Data0[16],Data1[16],Select);
mux2_1 mux17(DataOut[17],Data0[17],Data1[17],Select);
mux2_1 mux18(DataOut[18],Data0[18],Data1[18],Select);
mux2_1 mux19(DataOut[19],Data0[19],Data1[19],Select);
mux2_1 mux20(DataOut[20],Data0[20],Data1[20],Select);
mux2_1 mux21(DataOut[21],Data0[21],Data1[21],Select);
mux2_1 mux22(DataOut[22],Data0[22],Data1[22],Select);
mux2_1 mux23(DataOut[23],Data0[23],Data1[23],Select);
mux2_1 mux24(DataOut[24],Data0[24],Data1[24],Select);
mux2_1 mux25(DataOut[25],Data0[25],Data1[25],Select);
mux2_1 mux26(DataOut[26],Data0[26],Data1[26],Select);
mux2_1 mux27(DataOut[27],Data0[27],Data1[27],Select);
mux2_1 mux28(DataOut[28],Data0[28],Data1[28],Select);
mux2_1 mux29(DataOut[29],Data0[29],Data1[29],Select);
mux2_1 mux30(DataOut[30],Data0[30],Data1[30],Select);
mux2_1 mux31(DataOut[31],Data0[31],Data1[31],Select);

endmodule
