`timescale 1ns/1ps

module alu_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] Sel;

    wire [3:0] Result;
    wire Carry;

    alu uut(
        .A(A),
        .B(B),
        .Sel(Sel),
        .Result(Result),
        .Carry(Carry)
    );

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, alu_tb);

        $display("Time\tSel\tA\tB\tResult\tCarry");

        $monitor("%0t\t%b\t%b\t%b\t%b\t%b",
                  $time, Sel, A, B, Result, Carry);

        // Addition
        A = 4'b0101; B = 4'b0011; Sel = 3'b000; #10;

        // Subtraction
        A = 4'b1001; B = 4'b0010; Sel = 3'b001; #10;

        // AND
        A = 4'b1100; B = 4'b1010; Sel = 3'b010; #10;

        // OR
        A = 4'b1100; B = 4'b1010; Sel = 3'b011; #10;

        // XOR
        A = 4'b1100; B = 4'b1010; Sel = 3'b100; #10;

        // NOT
        A = 4'b1010; B = 4'b0000; Sel = 3'b101; #10;

        // Left Shift
        A = 4'b0011; B = 4'b0000; Sel = 3'b110; #10;

        // Right Shift
        A = 4'b1100; B = 4'b0000; Sel = 3'b111; #10;

        $finish;

    end

endmodule
