`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 09:07:16 PM
// Design Name: 
// Module Name: Jump_address
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


module Jump_address(Shiftby2_in, PCplus4, jumpdes_address);
  input [27:0] Shiftby2_in;
  input [31:0] PCplus4;
  output [31:0] jumpdes_address;

  assign jumpdes_address = {PCplus4[31:28], Shiftby2_in};
endmodule
