module bit_1_alu (
    input A, B,          // 1-bit inputs
    input Cin,           // Carry-in for addition/subtraction
    input [2:0] ALU_Sel, // 3-bit control
    output reg Result,   // 1-bit output
    output reg Cout      // Carry-out
);

    always @(*) begin
        case (ALU_Sel)
            3'b000: 
					{Cout, Result} = A & B;        // AND
            3'b001: 
					{Cout, Result} = A | B;        // OR
            3'b010: 
					{Cout, Result} = A ^ B;        // XOR
            3'b011: 
					{Cout, Result} = A + B + Cin;  // ADD
            3'b100: 
					{Cout, Result} = A - B - Cin;  // SUB
            3'b101: 
					{Cout, Result} = A;            // Pass-through A
            3'b110: 
					{Cout, Result} = B;            // Pass-through B
            3'b111: 
					{Cout, Result} = ~A;           // NOT A
            default: 
					{Cout, Result} = 0;
        endcase
    end
endmodule
