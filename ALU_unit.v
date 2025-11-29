`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 07:06:21 PM
// Design Name: 
// Module Name: ALU_unit
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


module ALU_unit(A, B, C, Control_in, ALU_Result, Zero, jr_en, sll_en);
input [31:0]A, B;
input [4:0]C;
input [3:0] Control_in;
output reg Zero, jr_en, sll_en;
output reg [31:0] ALU_Result;
always @ (Control_in, A, B)
begin 
case (Control_in)
4'b0000 : begin ALU_Result = A & B; end
4'b0001 : begin ALU_Result = A | B; end
4'b0010 : begin ALU_Result = A + B; end
4'b0110 : begin ALU_Result = A - B; end
4'b1000 : begin ALU_Result = A; end
4'b0111 : begin ALU_Result = (A<B)?32'd1:32'd0;end
4'b1111 : begin ALU_Result = B << C; end
default : begin ALU_Result = A + B; end
endcase
Zero = (ALU_Result == 0)?1'b1:1'b0;
jr_en = (Control_in == 4'b1000)?1'b1:1'b0;
sll_en = (Control_in == 4'b1111)?1'b1:1'b0;
end
endmodule
