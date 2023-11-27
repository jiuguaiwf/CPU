`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/01 18:39:15
// Design Name: 
// Module Name: MUX_3
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


module MUX_3(
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    input [1:0] s,
    output reg [31:0] out
    );
    always@(*)
    begin
        if (s==2'b00) out=a;
        else if (s==2'b01) out=b;
        else out=c;
    end
endmodule
