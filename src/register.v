module register(
	input clk,
	input write_enable,
	input [2:0] read_addr,
	input [7:0] write_data,
	output reg [7:0] read_data
);

	reg [7:0] reg_file [7:0];
	initial begin
		reg_file[0]=8'h00;
		reg_file[1]=8'h00;
		reg_file[2]=8'h00;
		reg_file[3]=8'h00;
		reg_file[4]=8'h00;
		reg_file[5]=8'h00;
		reg_file[6]=8'h00;
		reg_file[7]=8'h00;
	end

	always @(posedge clk) begin //sequential
		// write ops
		reg_file[read_addr] <= write_data;
	end

	always @(*) begin //combinational
		// read ops
		read_data=reg_file[read_addr];
	end
endmodule

