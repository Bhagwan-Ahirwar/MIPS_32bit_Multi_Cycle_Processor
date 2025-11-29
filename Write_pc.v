`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 10:53:12 PM
// Design Name: 
// Module Name: Write_pc
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


module Write_pc(Zero,PCWriteCond, PCWrite, PCWriteetc, jr_control);
input Zero,PCWriteCond, PCWrite, jr_control;
output PCWriteetc;

assign PCWriteetc = ((Zero&PCWriteCond)|PCWrite)|jr_control;

endmodule
