`timescale 10ns / 1ns


module main(
  input clk,            //clk100mhz
  input rstn,           //cpu_resetn

  input step,           //btnu
  input cont,           //btnd
  input chk,            //btnr
  input data,           //btnc
  input del,            //btnl
  input [15:0] x,       //sw15-0

  output stop,          //led16r
  output [15:0] led,    //led15-0
  output [7:0] an,      //an7-0
  output [6:0] seg,     //ca-cg 
  output [2:0] seg_sel//led17
    );
    
wire clk_cpu,rst_cpu,io_we,io_rd;
wire [7:0] io_addr;
wire [31:0] io_data,io_din,pc,chk_data;
wire [15:0] chk_addr;
    
    
///////////////////////////////////////////////
//CPU
///////////////////////////////////////////////
pdu pdu(
  .clk(clk),            //clk100mhz
  .rstn(rstn),           //cpu_resetn

  .step (step),           //btnu
  .cont( cont),           //btnd
  .chk( chk),            //btnr
  .data( data),           //btnc
  .del( del),            //btnl
  .x( x),       //sw15-0

  .stop( stop),          //led16r
  .led(led),    //led15-0
  .an(an),      //an7-0
  .seg(seg),     //ca-cg 
  .seg_sel( seg_sel), //led17

  .clk_cpu(clk_cpu),       //cpu's clk
  .rst_cpu(rst_cpu),       //cpu's rst

  //IO_BUS
  .io_addr(io_addr),
  .io_dout(io_dout),
  .io_we(io_we),
  .io_rd(io_rd),
  .io_din(io_din),

  //Debug_BUS
  .chk_pc( pc),
  .chk_addr( chk_addr),
  .chk_data( chk_data)
);   
///////////////////////////////////////////////
//CPU
///////////////////////////////////////////////

cpu_1 cpu (
   .clk(clk_cpu),  //(ʱ��Ƶ�ʲ�����100MHZ����ô��Ҫ���ͣ����忴CPU����) 
   .rst(rst_cpu),

  //IO_BUS
  .io_addr(io_addr),	//�����ַ
  .io_dout( io_dout),	//���������������
  .io_we(io_we),		//�������������ʱ��дʹ���ź�
  .io_rd(io_rd),		//��������������ʱ�Ķ�ʹ���ź�
  .io_din(io_din),	//�����������������
  
  //Debug_BUS
  .chk_pc(pc), 	        //��ǰִ��ָ���ַ
  .chk_addr(chk_addr),	    //����ͨ·״̬�ı����ַ   
  .chk_data(chk_data)    //����ͨ·״̬������
);
  
    
endmodule
