This project is about a 5-stage RISC-5 pipeline CPU with cache, branch prediction and I/O system.

Developed by Verilog, Vivado.

The CPU structure is as follows:

![](./img/1-cpu.png)

Control Correlation: control correlation occurs when the pipeline encounters branch instructions and other instructions that change the value of the PC:

![](./img/2-con.png)

This is solved by the Hazard module:

![](./img/4-hazard.png)

Total data path of the CPU (instruction information is stored through inter-segment registers):

![](./img/5-datapath.png)

Simulation results as well as results of datapath runs:

![](./img/6-simulation.png)

The sorting results on the FPGA development board are as follows:

![](./img/7-fpga.png)

BTB: Branch Target Buffer.
BHT: Branch History Table.
Below are the two different branch predictions for Bubble Sort and Rapid Sort.

![](./img/8-bubble.png)


![](./img/9-quick.png)

