`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 08:14:56 PM
// Design Name: 
// Module Name: shift_2_branch
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


module shift_2_branch(ImmExt, Shiftby2);
input [31:0] ImmExt;
output [31:0] Shiftby2;
assign Shiftby2 = ImmExt << 2;
endmodule
