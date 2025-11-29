`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 06:59:38 PM
// Design Name: 
// Module Name: MIPS_32bit_Multi_Cycle_Processor
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


module MIPS_32bit_Multi_Cycle_Processor(clk, rst);
input clk, rst;
wire [31:0] PCin_top, PC_top, read_address_top, MemData_out_top, instruction_top, read_data1_top, read_data2_top, rega_out, 
ALUin1_top, ALUin2_top, regb_out, Shift2, Shiftby2_top, ALU_Result_top, ALUOut_Reg_top, MDRout, MemData_out_top1, 
jump_address_top, PCin_top_1,MemData_out_top11;
wire [27:0] Jump_optoadd;
wire [4:0] Rd_top;
wire [3:0]ALU_controp_top;
wire [1:0] ALUSrcB_top, PCSource_top;
wire IorD_top, IRWrite_top, RegWrite_top, RegDst_top, ALUSrcA_top, PCWriteetc_top, Zero_beq;
wire PCWrite_top, PCWriteCond_top,MemRead_top, MemWrite_top, MemtoReg_top, PCSource1_top, 
PCSource0_top, ALUOp1_top,ALUOp0_top, ALUSrcB1_top, ALUSrcB0_top, Zero_top, jr_top, lui_en_top;


//PC
Program_Counter PC (.clk(clk), .rst(rst), .PC_in(PCin_top), .PC_out(PC_top), .PCWriteetc(PCWriteetc_top));

//PC Mux
Mux1 PC_mux (.sel1(IorD_top), .A1(PC_top), .B1(ALUOut_Reg_top), .Mux1_out(read_address_top));

//Data Memory
Data_Memory Data_Memory(.MemWrite(MemWrite_top), .MemRead(MemRead_top), .read_address(read_address_top), .Write_data(regb_out), .MemData_out(MemData_out_top));

//instruction register
Instruction_Registe IR (.clk(clk), .IRWrite(IRWrite_top), .instruction_in(MemData_out_top), .instruction_out(instruction_top));

//register file
Reg_File Reg_File(.clk(clk), .rst(rst), .RegWrite(RegWrite_top), .Rs(instruction_top[25:21]), .Rt(instruction_top[20:16]), .Rd(Rd_top), .Write_data_Reg(MemData_out_top1), .read_data1(read_data1_top), .read_data2(read_data2_top));

//rd Mux
Mux2 Rd_mux (.sel2(RegDst_top), .A2(instruction_top[20:16]), .B2(instruction_top[15:11]), .Mux2_out(Rd_top));

//A Reg

Register_32bit A_Reg (.clk(clk), .rst(rst), .in(read_data1_top) ,.out(rega_out));

//ALU Mux A
Mux3 ALU_muxA(.sel3(ALUSrcA_top), .A3(PC_top), .B3(rega_out), .Mux3_out(ALUin1_top));

//B Reg

Register_32bit B_Reg (.clk(clk), .rst(rst), .in(read_data2_top) ,.out(regb_out));


//Immediate Generator
ImmGen ImmGen (.Opcode(instruction_top[31:26]), .instruction(instruction_top[31:0]), .ImmExt(Shift2));

//Shift by 2 for branch
shift_2_branch shift_2_branch (.ImmExt(Shift2), .Shiftby2(Shiftby2_top));

//ALU Mux2
MUX_4x1_32bit ALU_muxB (.sel({ALUSrcB1_top,ALUSrcB0_top}), .regb(regb_out), .ImmExt(Shift2), .Shiftby2(Shiftby2_top), .ALUin2(ALUin2_top));

//ALU Unit
ALU_unit ALU_unit (.A(ALUin1_top), .B(ALUin2_top), .C(instruction_top[10:6]), .Control_in(ALU_controp_top), .ALU_Result(ALU_Result_top), .Zero(Zero_beq), .jr_en(), .sll_en());

//ALUOut Reg.

Register_32bit ALUOut_Reg (.clk(clk), .rst(rst), .in(ALU_Result_top) ,.out(ALUOut_Reg_top));

//MDR Reg.

Register_32bit MDR (.clk(clk), .rst(rst), .in(MemData_out_top) ,.out(MDRout));

//Memory mux
Mux4 Memory_mux(.sel4(MemtoReg_top), .A4(ALUOut_Reg_top), .B4(MDRout), .Mux4_out(MemData_out_top11));

//shift by 2 for jump

shift_2_jump shift_2_jump(.Opcode(instruction_top[25:0]), .Shiftby2_out(Jump_optoadd));

// Jump address

Jump_address Jump_address (.Shiftby2_in(Jump_optoadd), .jumpdes_address(jump_address_top),.PCplus4(PC_top));


//PC Source mux

MUX_4x1_PCSource PCSourec_mux (.sel({PCSource1_top, PCSource0_top}), .jumpdes_address(jump_address_top), .ALU_Result(ALU_Result_top), .ALUout_reg(ALUOut_Reg_top), .PCin(PCin_top_1));


//ALU Control

ALU_Control ALU_Control (.ALUOp1(ALUOp1_top), .ALUOp0(ALUOp0_top), .function_f(instruction_top[5:0]), .Control_out(ALU_controp_top), .jr_control(jr_top));

//jr mux
Mux11 jr_mux(.sel11(jr_top), .A11(PCin_top_1), .B11(rega_out), .Mux11_out(PCin_top));

//beq_bne
beq_bne beq_bne(.Zero(Zero_beq), .Opcode(instruction_top[31:26]), .Zero_out(Zero_top));

//PC Write
Write_pc Write_pc (.Zero(Zero_top),.PCWriteCond(PCWriteCond_top), .PCWrite(PCWrite_top), .PCWriteetc(PCWriteetc_top),.jr_control(jr_top));

//lui mux
Mux12 lui_mux (.sel12(lui_en_top), .A12(MemData_out_top11), .B12(Shift2), .Mux12_out(MemData_out_top1));

//control unit

Control_Unit Control_Unit(
    .Opcode(instruction_top[31:26]),.clk(clk),.rst(rst),
    .PCWrite(PCWrite_top), .PCWriteCond(PCWriteCond_top), .IorD(IorD_top), .MemRead(MemRead_top), .MemWrite(MemWrite_top), .IRWrite(IRWrite_top),
    .MemtoReg(MemtoReg_top), .PCSource1(PCSource1_top), .PCSource0(PCSource0_top), .ALUOp1(ALUOp1_top), .ALUOp0(ALUOp0_top), .ALUSrcB1(ALUSrcB1_top), .ALUSrcB0(ALUSrcB0_top),
     .ALUSrcA(ALUSrcA_top),.RegWrite(RegWrite_top), .RegDst(RegDst_top), .lui_en(lui_en_top));

endmodule
