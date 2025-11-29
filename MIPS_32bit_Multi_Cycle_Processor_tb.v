`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2025 05:38:28 PM
// Design Name: 
// Module Name: MIPS_32bit_Multi_Cycle_Processor_tb
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


module MIPS_32bit_Multi_Cycle_Processor_tb;
reg clk, rst;
MIPS_32bit_Multi_Cycle_Processor uut(.clk(clk), .rst(rst));
initial begin
clk=0;
rst=1;
#550;
rst=0;
end

always begin
#100 clk=~clk;
end
initial begin
#25000;
$stop;
end

endmodule
