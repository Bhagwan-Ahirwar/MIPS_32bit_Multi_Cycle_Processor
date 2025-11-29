`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 07:03:14 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(MemWrite, MemRead, read_address, Write_data, MemData_out);
input MemWrite, MemRead;
input [31:0]read_address, Write_data ;
output reg [31:0]MemData_out;
integer i;
reg [7:0] D_Memory [0:1095];
initial
begin

//Instruction Memory
//lw r4 100(r3) 
D_Memory[0] = 8'b10001100;
D_Memory[1] = 8'b01100100;
D_Memory[2] = 8'b00000000;
D_Memory[3] = 8'b01100100;

//lw r5 104(r3) 
D_Memory[4] = 8'b10001100;
D_Memory[5] = 8'b01100101;
D_Memory[6] = 8'b00000000;
D_Memory[7] = 8'b01101000;
//add r6 r4 r5
D_Memory[8] = 8'b00000000;
D_Memory[9] = 8'b10000101;
D_Memory[10] = 8'b00110000;
D_Memory[11] = 8'b00100000;
//sw r6 108(r3)
D_Memory[12] = 8'b10101100;
D_Memory[13] = 8'b01100110;
D_Memory[14] = 8'b00000000;
D_Memory[15] = 8'b01101100;
//sub r7 r4 r5
D_Memory[16] = 8'b00000000;
D_Memory[17] = 8'b10000101;
D_Memory[18] = 8'b00111000;
D_Memory[19] = 8'b00100010;
//sw r7 112(r3)
D_Memory[20] = 8'b10101100;
D_Memory[21] = 8'b01100111;
D_Memory[22] = 8'b00000000;
D_Memory[23] = 8'b01110000;

//and r8 r4 r5
D_Memory[24] = 8'b00000000;
D_Memory[25] = 8'b10000110;
D_Memory[26] = 8'b01000000;
D_Memory[27] = 8'b00100100;

//sw r8 116(r3)
D_Memory[28] = 8'b10101100;
D_Memory[29] = 8'b01101000;
D_Memory[30] = 8'b00000000;
D_Memory[31] = 8'b01110100;

//or r9 r4 r5
D_Memory[32] = 8'b00000000;
D_Memory[33] = 8'b10000101;
D_Memory[34] = 8'b01001000;
D_Memory[35] = 8'b00100101;

//sw r9 120(r3)
D_Memory[36] = 8'b10101100;
D_Memory[37] = 8'b01101001;
D_Memory[38] = 8'b00000000;
D_Memory[39] = 8'b01111000;



//lui

/* D_Memory[40] = 8'b00111100;
D_Memory[41] = 8'b00001011;
D_Memory[42] = 8'b00000000;
D_Memory[43] = 8'b00000001;
*/

//slt r10 r4 r5
D_Memory[40] = 8'b00000000;
D_Memory[41] = 8'b10100100;
D_Memory[42] = 8'b01010000;
D_Memory[43] = 8'b00101010;
/*
//beq r10 r4 r5
D_Memory[44] = 8'b00010100;
D_Memory[45] = 8'b10000101;
D_Memory[46] = 8'b00000000;
D_Memory[47] = 8'b00001101;

//jump r10 r4 r5
D_Memory[44] = 8'b00001000;
D_Memory[45] = 8'b00000000;
D_Memory[46] = 8'b00000000;
D_Memory[47] = 8'b00000001;
*/

//sll
D_Memory[44] = 8'b00000000;
D_Memory[45] = 8'b00001001;
D_Memory[46] = 8'b10000001;
D_Memory[47] = 8'b00000000;

//slti r15 r9 33
D_Memory[48] = 8'b00101001;
D_Memory[49] = 8'b00101111;
D_Memory[50] = 8'b00000000;
D_Memory[51] = 8'b00100001;


//lui r11 1
D_Memory[52] = 8'b00111100;
D_Memory[53] = 8'b00001011;
D_Memory[54] = 8'b00000000;
D_Memory[55] = 8'b00000001;
/*
//jr 
D_Memory[52] = 8'b00000011;
D_Memory[53] = 8'b11100000;
D_Memory[54] = 8'b00000000;
D_Memory[55] = 8'b00001000;


//slt r10 r5 r4
D_Memory[48] = 8'b00000000;
D_Memory[49] = 8'b10100100;
D_Memory[50] = 8'b01010000;
D_Memory[51] = 8'b00101010;

//lui r11 1
D_Memory[52] = 8'b00111100;
D_Memory[53] = 8'b00001011;
D_Memory[54] = 8'b00000000;
D_Memory[55] = 8'b00000001;

//slti r15 r9 33
D_Memory[56] = 8'b00101001;
D_Memory[57] = 8'b00101111;
D_Memory[58] = 8'b00000000;
D_Memory[59] = 8'b00100001;
*/
//sw
D_Memory[60] = 8'b10001100;
D_Memory[61] = 8'b01111111;
D_Memory[62] = 8'b00000000;
D_Memory[63] = 8'b10000000;

//sll
D_Memory[64] = 8'b00000000;
D_Memory[65] = 8'b00001001;
D_Memory[66] = 8'b10000001;
D_Memory[67] = 8'b00000000;

//jr 
D_Memory[68] = 8'b00000011;
D_Memory[69] = 8'b11100000;
D_Memory[70] = 8'b00000000;
D_Memory[71] = 8'b00001000;



//Data Memory
D_Memory[100] = 8'b00000000;
D_Memory[101] = 8'b00000000;
D_Memory[102] = 8'b00000000;
D_Memory[103] = 8'b00011100;

D_Memory[104] = 8'b00000000;
D_Memory[105] = 8'b00000000;
D_Memory[106] = 8'b00000000;
D_Memory[107] = 8'b00000010;

D_Memory[108] = 8'b00000000;
D_Memory[109] = 8'b00000000;
D_Memory[110] = 8'b00000000;
D_Memory[111] = 8'b00000000;

D_Memory[112] = 8'b00000000;
D_Memory[113] = 8'b00000000;
D_Memory[114] = 8'b00000000;
D_Memory[115] = 8'b00000000;

D_Memory[124] = 8'b00000000;
D_Memory[125] = 8'b00000000;
D_Memory[126] = 8'b00000000;
D_Memory[127] = 8'b00101100;

end
 always @ (MemWrite or read_address or MemRead) begin
 if(MemWrite && ~MemRead) begin
{D_Memory[read_address], D_Memory[read_address+32'd1], D_Memory[read_address+32'd2], D_Memory[read_address+32'd3]} <= Write_data;
end
end
 always @ (*) begin
 if(MemRead && ~MemWrite) begin
MemData_out = {D_Memory[read_address], D_Memory[read_address+32'd1], D_Memory[read_address+32'd2], D_Memory[read_address+32'd3]}; 
end else begin
MemData_out = 32'b00;
end
end

endmodule
