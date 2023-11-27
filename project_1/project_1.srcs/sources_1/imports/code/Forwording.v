`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/01 20:15:53
// Design Name: 
// Module Name: Forwording
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


module Forwording(
    input [4:0] id_reg1_idx,
    input [4:0] id_reg2_idx,
    input wb_reg_wr_en,
    input [4:0] wb_reg_wr_idx,
    input [4:0] mem_reg_wr_idx,
    input mem_reg_wr_en,
    output reg [1:0] alu_reg1_forwarding_ctrl,//0不变,1选alu,2选data
    output reg [1:0] alu_reg2_forwarding_ctrl 
    );
    always@(*)
    begin
        /*
        if (wb_reg_wr_en && (wb_reg_wr_idx==id_reg1_idx)) alu_reg1_forwarding_ctrl=2;
        else if (mem_reg_wr_en && (mem_reg_wr_idx==id_reg1_idx)) alu_reg1_forwarding_ctrl=2;
        else alu_reg1_forwarding_ctrl=0;

        if (wb_reg_wr_en && (wb_reg_wr_idx==id_reg2_idx)) alu_reg2_forwarding_ctrl=1;
        else if (mem_reg_wr_en && (mem_reg_wr_idx==id_reg2_idx)) alu_reg2_forwarding_ctrl=2;
        else alu_reg2_forwarding_ctrl=0;
        */
        if (mem_reg_wr_en && (mem_reg_wr_idx==id_reg1_idx)) alu_reg1_forwarding_ctrl=1;
        else if (wb_reg_wr_en && (wb_reg_wr_idx==id_reg1_idx)) alu_reg1_forwarding_ctrl=2;
        else alu_reg1_forwarding_ctrl=0;

        if (mem_reg_wr_en && (mem_reg_wr_idx==id_reg2_idx)) alu_reg2_forwarding_ctrl=1;
        else if (wb_reg_wr_en && (wb_reg_wr_idx==id_reg2_idx)) alu_reg2_forwarding_ctrl=2;
        else alu_reg2_forwarding_ctrl=0;
    end
endmodule
