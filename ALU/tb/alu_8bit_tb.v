`timescale 1ns/1ps

module alu_8bit_tb;

reg [7:0] A;
reg [7:0] B;
reg [2:0] Sel;

wire [7:0] Result;
wire Carry;

alu_8bit uut (
    .A(A),
    .B(B),
    .Sel(Sel),
    .Result(Result),
    .Carry(Carry)
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, alu_8bit_tb);

    $display("Time\tA\t\tB\t\tSel\tResult\t\tCarry");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",
              $time, A, B, Sel, Result, Carry);

    // Addition
    A = 8'b00010101; B = 8'b00001010; Sel = 3'b000;
    #10;

    // Subtraction
    A = 8'b00010101; B = 8'b00000101; Sel = 3'b001;
    #10;

    // AND
    A = 8'b11001100; B = 8'b10101010; Sel = 3'b010;
    #10;

    // OR
    A = 8'b11001100; B = 8'b10101010; Sel = 3'b011;
    #10;

    // XOR
    A = 8'b11001100; B = 8'b10101010; Sel = 3'b100;
    #10;

    // NOT
    A = 8'b11001100; Sel = 3'b101;
    #10;

    // Left Shift
    A = 8'b00001111; Sel = 3'b110;
    #10;

    // Right Shift
    A = 8'b11110000; Sel = 3'b111;
    #10;

    // Addition with Carry
    A = 8'b11111111; B = 8'b00000001; Sel = 3'b000;
    #10;

    $finish;

end

endmodule
