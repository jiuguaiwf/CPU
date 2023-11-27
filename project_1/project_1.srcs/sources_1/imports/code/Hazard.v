`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/01 20:30:23
// Design Name: 
// Module Name: Hazard
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


module Hazard(
    input wb_do_reg_write,
    input mem_do_reg_write,
    input [4:0] id_reg2_idx,
    input [4:0] id_reg1_idx,
    input ex_do_mem_read_en,
    input [4:0] ex_reg_wr_idx,
    input [6:0] opcode,
    input PC_change,

    output reg hazardEXMEMClear,
    output reg hazardFEEnable,
    output reg hazardIDEXEnable,
    output reg hazardIDEXClear,
    output reg hazardIFIDEnable,
    output reg hazardIFIDClear
    );
    parameter JAL=7'b1101111;
    parameter JALR=7'b1100111;
    parameter BEQ_BLT=7'b1100011;
    always@(*)
    begin
        if (opcode==JAL||opcode==JALR||PC_change) 
        begin
            hazardEXMEMClear=0;
            hazardIDEXClear=1;
            hazardIDEXEnable=1;
            hazardIFIDClear=1;
            hazardIFIDEnable=1;
            hazardFEEnable=1;
        end 
        else if (ex_do_mem_read_en && (id_reg1_idx==ex_reg_wr_idx || id_reg2_idx==ex_reg_wr_idx))
        begin
            hazardEXMEMClear=0;
            hazardIDEXClear=1;
            hazardIDEXEnable=1;
            hazardIFIDClear=0;
            hazardIFIDEnable=0;
            hazardFEEnable=0;
        end          
        else
        begin
            hazardEXMEMClear=0;
            hazardIDEXClear=0;
            hazardIDEXEnable=1;
            hazardIFIDClear=0;
            hazardIFIDEnable=1;
            hazardFEEnable=1;
        end 
    end
endmodule
