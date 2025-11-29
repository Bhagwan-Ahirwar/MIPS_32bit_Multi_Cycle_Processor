`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 07:20:06 PM
// Design Name: 
// Module Name: Instruction_Register
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


module Instruction_Registe(clk, IRWrite, instruction_in, instruction_out);
    input clk, IRWrite; // clock & write enable   
    input [31:0] instruction_in; // instruction input
    output reg [31:0] instruction_out; // instruction outpu
    
always @(posedge clk) begin
    if (IRWrite) begin
       instruction_out <= instruction_in;
    end
end

endmodule
