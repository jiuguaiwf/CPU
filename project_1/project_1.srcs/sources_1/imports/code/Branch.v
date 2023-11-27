`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/02 14:41:11
// Design Name: 
// Module Name: Branch
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


module Branch(
    input [31:0] op1,
    input [31:0] op2,
    input [2:0] comp,
    output reg res
    );
    always@(*)
    begin
        if (comp==3'b100)
        begin
            if ($signed(op1)<$signed(op2)) res=1;
            else res=0;
        end
        else 
        begin
            if (op1==op2) res=1;
            else res=0;
        end
    end
endmodule
