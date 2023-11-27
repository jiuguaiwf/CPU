This project is about a 5-stage RISC-5 pipeline CPU with cache, branch prediction and I/O system.

Developed by Verilog, Vivado.

The CPU structure is as follows:

![](https://s3.hedgedoc.org/demo/uploads/6ebd48e0-77ed-45d1-98be-bd459ea9d0c6.png)

Control Correlation: control correlation occurs when the pipeline encounters branch instructions and other instructions that change the value of the PC:

![](https://s3.hedgedoc.org/demo/uploads/cbe756e9-c64e-4f21-bfbc-2de253c48c70.png)

This is solved by the Hazard module:

![](https://s3.hedgedoc.org/demo/uploads/6753dd37-aa4a-473b-9907-47260ace324a.png)

Total data path of the CPU (instruction information is stored through inter-segment registers):

![](https://s3.hedgedoc.org/demo/uploads/be761f06-59fa-41f0-9bdc-eef91dfc09ca.png)

Simulation results as well as results of datapath runs:

![](https://s3.hedgedoc.org/demo/uploads/3187fec9-15b2-4d96-8059-bc089e0dfd3e.png)

The sorting results on the FPGA development board are as follows:

![](https://s3.hedgedoc.org/demo/uploads/6b7054f9-a906-4ac1-90d6-e43cd47de74f.png)

BTB: Branch Target Buffer
BHT: Branch History Table
Below are the two different branch predictions for Bubble Sort and Rapid Sort.

![](https://s3.hedgedoc.org/demo/uploads/bee75213-4462-44e2-843b-cc36ea02ad50.png)

![](https://s3.hedgedoc.org/demo/uploads/1041d5af-a018-4539-b2f7-ae2c5b68bfb5.png)
