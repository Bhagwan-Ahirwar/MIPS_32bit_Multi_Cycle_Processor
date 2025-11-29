`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 07:48:20 PM
// Design Name: 
// Module Name: Register_32bit
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


module Register_32bit(clk,rst, in,out);
    input clk, rst;
    input [31:0] in;
    output reg [31:0] out;

always @(posedge clk) begin
   begin
        out <= in;
    end
     end

endmodule
