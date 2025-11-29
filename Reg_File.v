`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 07:04:51 PM
// Design Name: 
// Module Name: Reg_File
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Reg_File(clk, rst, RegWrite, Rs, Rt, Rd, Write_data_Reg, read_data1, read_data2);
input clk, rst, RegWrite;
input [4:0] Rs, Rt, Rd;
input [31:0] Write_data_Reg; 
integer i;
output reg [31:0] read_data1, read_data2;

reg [31:0] Register[31:0];

initial begin
Register[0]= 0;
Register[1]= 0;
Register[2]= 0;
Register[3]= 0;
Register[4]= 32;
Register[5]= 12;
Register[6]= 0;
Register[7]= 0;
Register[8]= 0;
Register[9]= 0;
Register[10]= 0;
Register[11]= 0;
Register[12]= 0;
Register[13]= 0;
Register[14]= 0;
Register[15]= 0;
Register[16]= 0;
Register[17]= 0;
Register[18]= 0;
Register[19]= 0;
Register[20]= 0;
Register[21]= 0;
Register[22]= 0;
Register[23]= 0;
Register[24]= 0;
Register[25]= 0;
Register[26]= 0;
Register[27]= 0;
Register[28]= 0;
Register[29]= 0;
Register[30]= 0;
Register[31]= 0;
end

always @ (posedge clk or posedge rst)
begin
if(rst)
begin 
for(i=0; i<31; i=i+1) begin
Register[i] <= 32'b0;
end
end
else if (RegWrite) begin 
        Register[Rd] <= Write_data_Reg; 
end
end

always@(*) begin
read_data1 = Register [Rs];
read_data2 = Register [Rt];  
end

endmodule
