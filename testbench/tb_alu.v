module tb_alu;
	reg [7:0] operand1;
	reg [7:0] operand2;
	reg [2:0] operation;
	reg enable;
	wire [7:0] result;

	initial begin
		$dumpfile("alu.vcd");
		$dumpvars();
	end

	//instatiate alu module
	alu alu_inst(
		.operand1(operand1),
		.operand2(operand2),
		.operation(operation),
		.result(result),
		.enable(enable)
	);
	//initialize the values
	initial begin
		enable=1;
		operand1=8'b00001101;
		operand2=8'b00000011;
		operation=3'b000;
		#10 operation = 3'b001;
		#10 operation=3'b010;
		#10 operation=3'b011;
		#10 operation=3'b100;
		#10 operation=3'b101;
		#10 operation=3'b110;
		#10 $finish;
	end

	initial begin
		$monitor("operand1=%b operand2=%b operation=%b result=%b")
	end
endmodule


