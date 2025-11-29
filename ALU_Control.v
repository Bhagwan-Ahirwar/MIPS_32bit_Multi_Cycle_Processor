`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 09:23:05 PM
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control(ALUOp1, ALUOp0, function_f, Control_out, jr_control);
input [5:0]function_f;
input ALUOp1, ALUOp0;
output reg [3:0] Control_out;
output reg jr_control;

always @(*) begin
  jr_control = 1'b0; // Default to 0

 case ({ALUOp1, ALUOp0})
 2'b00 : begin Control_out = 4'b0010; //lw & sw, add 
 end 
 2'b01 : begin Control_out = 4'b0110; //beq, sub
 end 
 //slti
 2'b11 : begin Control_out = 4'b0111; //
 end 
 
 2'b10 : begin
 case (function_f)
 6'b100000 : Control_out = 4'b0010; //R type add
 6'b100010 : Control_out = 4'b0110; //R type sub
 6'b100100 : Control_out = 4'b0000; //R type and
 6'b100101 : Control_out = 4'b0001; //R type or
 6'b101010 : Control_out = 4'b0111; //R type slt
 //6'b001000 : Control_out = 4'b1000; //R type slt
 6'b000000 : Control_out = 4'b1111; //R type sll

 6'b001000: begin // jr
          Control_out = 4'b1000;
          jr_control = 1'b1;
        end
        default: Control_out = 4'b0000; // default case
  
endcase
end
endcase
end

endmodule
