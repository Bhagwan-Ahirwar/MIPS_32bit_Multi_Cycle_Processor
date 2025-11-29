`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 04:17:36 PM
// Design Name: 
// Module Name: beq_bne
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


module beq_bne(Zero, Opcode, Zero_out);

input Zero;
input [5:0]Opcode;
output reg Zero_out;

always @(*) begin
  case (Opcode)
    6'b000100: Zero_out = Zero;    // beq
    6'b000101: Zero_out = ~Zero;   // bne
    default:   Zero_out = 0;
  endcase
end
endmodule
