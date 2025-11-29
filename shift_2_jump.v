`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 09:03:17 PM
// Design Name: 
// Module Name: shift_2_jump
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


module shift_2_jump(Opcode, Shiftby2_out);
input [25:0] Opcode;
output [27:0] Shiftby2_out;

assign Shiftby2_out = Opcode << 2;
endmodule
