`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 08:11:10 PM
// Design Name: 
// Module Name: ImmGen
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


module ImmGen (Opcode, instruction, ImmExt);
input [5:0] Opcode;
input [31:0] instruction;
output reg [31:0] ImmExt;

always @(*) begin
      case(Opcode)
      6'b100011 : ImmExt =  {{16{instruction[15]}}, instruction [15:0]};   //lw
      6'b101011 : ImmExt =  {{16{instruction[15]}}, instruction [15:0]};   //sw
      6'b000100 : ImmExt =  {{16{instruction[15]}}, instruction [15:0]};  //beq
      6'b000101 : ImmExt =  {{16{instruction[15]}}, instruction [15:0]};  //bne
      6'b001111 : ImmExt =  {{instruction[15:0]}, 16'b0};  //lui
      6'b001010 : ImmExt =  {{instruction[15:0]}, 16'b0};  //slti
      
      
     default : ImmExt = 32'b0;
     endcase
end


endmodule
