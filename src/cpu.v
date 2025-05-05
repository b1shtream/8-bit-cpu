module cpu(
	input wire clk,
	input wire reset,
	input wire [15:0] instr,
	output reg [7:0] result
);
	wire [7:0] operand1;
	wire [7:0] operand2;
	reg [7:0] alu_result;
	reg [2:0] alu_op;
	reg [3:0] dest_reg;
	reg [7:0] reg_write_data;
	reg [7:0] addr;
	reg write_enable;
	wire [7:0] data_out; 


	//instatiations of various modules
	//memory instatiation
	memory mem_inst(
		.clk(clk),
		.write_enable(write_enable),
		.addr(addr),
		.data_in(reg_write_data),
		.dat_out(data_out)
	);


	//alu instantiation
	
	alu alu_inst(
		.operand1(operand1),
		.operand2(operand2),
		.operation(alu_op),
		.enable(1'b1),
		.result(alu_result)
	);

	// register file instantiation
	
	register reg_fil(
		.clk(clk),
		.write_enable(write_enable),
		.read_addr(dest_reg),
		.write_data(reg_write_data),
		.read_data(operand1)
	);

	//combinational logic block
	always @(*) begin
		alu_op=instr[14:12];  //extraaact alu operation
	end

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			result<=8'b0;
			write_enable<=0;
		end else begin
			case (alu_op)
				3'b000: begin //Immediate load to Register
					write_enable<=1;
					dest_reg<=instr[11:8];
					reg_write_data<=instr[7:0];
				end
				3'b001: begin // store register to memory
					write_enable<=1;
					addr<=instr[7:0];
					dest_reg<=instr[11:8];
					reg_write_data<=operand1;
				end
				3'b010: begin //read data from memory to register
					write_enable<=0; //read mode(memr)
					addr<=instr[7:0];
					result<=data_out;
					dest_reg<=instr[11:8];
					reg_write_data<=data_out;
				end
				3'b011: begin  //alu operation using register value and immediate value
					write_enable<=1;
					dest_reg<=instr[11:8];
					operand2<=instr[7:0];
					result<=alu_result;
					reg_write_data<=alu_result;
				end
				default: begin
					write_enable<=0;
				end
			endcase
		end
	end
endmodule



















