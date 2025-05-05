module program_counter(
	input wire clk,
	input wire reset,
	input enable,
	output reg [7:0] pc
);
	always @(posedge clk or posedge reset) begin
		if(reset) begin
			pc <= 8'b00000000;
		end else if (enable) begin
			pc <= pc+1;
		end
	end
endmodule
