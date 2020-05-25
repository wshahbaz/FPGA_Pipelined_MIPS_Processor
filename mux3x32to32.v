`timescale 1 ps / 100 fs
// mux3x32to32
module mux3x32to32(DataOut,A,B,C,Select);
output [31:0] DataOut;
input [1:0] Select;
input [31:0] A,B,C;
wire [31:0] DataOut1,DataOut2;

mux2x32to32 muxAB(DataOut1,A,B, Select[1]);
mux2x32to32 muxCA(DataOut2,C,A, Select[1]);
mux2x32to32 muxABC(DataOut,DataOut1,DataOut2, Select[0]);

endmodule