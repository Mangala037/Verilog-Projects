`timescale 1ns/1ps

module alu_16bit_tb;

reg [15:0] A;
reg [15:0] B;
reg [2:0] Sel;

wire [15:0] Result;
wire Carry;

alu_16bit uut (
    .A(A),
    .B(B),
    .Sel(Sel),
    .Result(Result),
    .Carry(Carry)
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, alu_16bit_tb);

    $display("Time\tA\t\t\tB\t\t\tSel\tResult\t\t\tCarry");
    $monitor("%0t\t%h\t%h\t%b\t%h\t%b",
              $time, A, B, Sel, Result, Carry);

    // Addition
    A = 16'h0015; B = 16'h000A; Sel = 3'b000;
    #10;

    // Subtraction
    A = 16'h0015; B = 16'h0005; Sel = 3'b001;
    #10;

    // AND
    A = 16'hCCCC; B = 16'hAAAA; Sel = 3'b010;
    #10;

    // OR
    A = 16'hCCCC; B = 16'hAAAA; Sel = 3'b011;
    #10;

    // XOR
    A = 16'hCCCC; B = 16'hAAAA; Sel = 3'b100;
    #10;

    // NOT
    A = 16'hCCCC; Sel = 3'b101;
    #10;

    // Left Shift
    A = 16'h000F; Sel = 3'b110;
    #10;

    // Right Shift
    A = 16'hF000; Sel = 3'b111;
    #10;

    // Addition with Carry
    A = 16'hFFFF; B = 16'h0001; Sel = 3'b000;
    #10;

    $finish;

end

endmodule
