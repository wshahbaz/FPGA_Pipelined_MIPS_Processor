`timescale 1 ps / 100 fs
// Control singals for JR instruction
module JRControl_Block( JRControl, ALUOp, Function);
output JRControl;
reg JRControl;
input [1:0] ALUOp;
input [5:0] Function;
wire [7:0] test;
assign test = {ALUOp,Function};
always @(test)
case (test)
 8'b10001000 : JRControl=1'b1; 
 default: JRControl=1'b0;
 endcase
endmodule