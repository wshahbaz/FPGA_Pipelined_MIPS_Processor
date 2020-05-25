`timescale 1 ps / 100 fs
// Data Memory 
module dataMem(data, address, writedata, writeenable,MemRead,clk);

input [31:0] address, writedata;
input writeenable,MemRead, clk;
output [31:0] data;
reg [7:0] datamem[1023:0];
reg [31:0] temp;

buf #1000 buf0(data[0],temp[0]),
   buf1(data[1],temp[1]),
   buf2(data[2],temp[2]),
   buf3(data[3],temp[3]),
   buf4(data[4],temp[4]),
   buf5(data[5],temp[5]),
   buf6(data[6],temp[6]),
   buf7(data[7],temp[7]),
   buf8(data[8],temp[8]),
   buf9(data[9],temp[9]),
   buf10(data[10],temp[10]),
   buf11(data[11],temp[11]),
   buf12(data[12],temp[12]),
   buf13(data[13],temp[13]),
   buf14(data[14],temp[14]),
   buf15(data[15],temp[15]),
   buf16(data[16],temp[16]),
   buf17(data[17],temp[17]),
   buf18(data[18],temp[18]),
   buf19(data[19],temp[19]),
   buf20(data[20],temp[20]),
   buf21(data[21],temp[21]),
   buf22(data[22],temp[22]),
   buf23(data[23],temp[23]),
   buf24(data[24],temp[24]),
   buf25(data[25],temp[25]),
   buf26(data[26],temp[26]),
   buf27(data[27],temp[27]),
   buf28(data[28],temp[28]),
   buf29(data[29],temp[29]),
   buf30(data[30],temp[30]),
   buf31(data[31],temp[31]);

always @(posedge clk)
 if (writeenable)
 begin
  datamem[address]=writedata[31:24];
  datamem[address+1]=writedata[23:16];
  datamem[address+2]=writedata[15:8];
  datamem[address+3]=writedata[7:0];
 end

always @(address or datamem[address] or datamem[address+1] or datamem[address+2] or datamem[address+3])
begin
 temp={datamem[address],datamem[address+1],datamem[address+2],datamem[address+3]};
end

// initial
// begin
// $readmemh("data.dat", datamem);
// end

endmodule