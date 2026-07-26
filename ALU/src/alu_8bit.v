module alu_8bit(
    input [7:0] A,
    input [7:0] B,
    input [2:0] Sel,
    output reg [7:0] Result,
    output reg Carry
);

always @(*) begin
    Carry = 1'b0;

    case (Sel)

        // Addition
        3'b000:
            {Carry, Result} = A + B;

        // Subtraction
        3'b001:
            {Carry, Result} = A - B;

        // AND
        3'b010:
            Result = A & B;

        // OR
        3'b011:
            Result = A | B;

        // XOR
        3'b100:
            Result = A ^ B;

        // NOT
        3'b101:
            Result = ~A;

        // Left Shift
        3'b110:
            Result = A << 1;

        // Right Shift
        3'b111:
            Result = A >> 1;

        default: begin
            Result = 8'b00000000;
            Carry = 1'b0;
        end

    endcase
end

endmodule
