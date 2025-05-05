module memory (
	input wire clk,
	input wire write_enable,
	input wire [7:0] addr,
	input wire [7:0] data_in,
	input reg [7:0] data_out
)

//memory -> array of 256 8-bit registers
	reg [7:0] mem[255:0];
	integer i;
	initial begin
		for(i=0;i<256;i=i+1) begin
			mem[i]=8'b00000000; //initialization with zero
		end
	end

	initial begin
		data_out=8'b00000000;
	end

	always @(*) begin
		if (write_enable) begin
			//write op
			mem[addr]<=data_in;
		end
		else 
		begin
			data_out<=mem[addr];
		end
	end
endmodule

