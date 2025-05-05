module tb_register7;
	reg clk;
	reg write_enable;
	reg [2:0] read_addr;
	reg [7:0] write_data;
	wire [7:0] read_data

	reg [7:0] reg_file [7:0];
	initial begin


