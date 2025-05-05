module alu (
	input [7:0] operand1,
	input [7:0] operand2,
	input [2:0] operation,
	input enable,
	output reg [7:0] result
);
	always @(*) begin
		if (enable) begin
			case(operation)
				//arithmetic
				3'b011: result<= operand1 + operand2;
				3'b100: result <= operand1 - operand2;
				3'b010: result <= operand1 * operand2;
				3'b111: result <= operand1 / operand2;
				default: result <= 8'b00000000;
			endcase
		end
	end
endmodule

