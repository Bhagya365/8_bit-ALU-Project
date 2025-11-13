module bit_8_alu_tb;
    reg [7:0] A, B;
    reg [2:0] ALU_Sel;
    reg Cin;
    wire [7:0] ALU_Out;
    wire Cout;
    
    bit_8_alu myALU (
        .A(A), .B(B), .ALU_Sel(ALU_Sel), .Cin(Cin),
        .ALU_Out(ALU_Out), .Cout(Cout)
    );

    initial 
		begin
        A = 8'b01001101; B = 8'b01000011; Cin = 0;

        ALU_Sel = 3'b000; #10; // AND
        ALU_Sel = 3'b001; #10; // OR
        ALU_Sel = 3'b010; #10; // XOR
        ALU_Sel = 3'b011; #10; // ADD
        ALU_Sel = 3'b100; #10; // SUBTRACT
        ALU_Sel = 3'b101; #10; // Pass-through A
        ALU_Sel = 3'b110; #10; // Pass-through B
        ALU_Sel = 3'b111; #10; // NOT A
        
        $stop;
	   end
endmodule
