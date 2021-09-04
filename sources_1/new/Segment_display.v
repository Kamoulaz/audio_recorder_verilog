`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 03:35:47 AM
// Design Name: 
// Module Name: Segment_display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Segment_display(
    input [3:0] D_0,
    input [3:0] D_1,
    input clock,
    output A0,
    output A1,
    output A2,
    output A3,
    output A4,
    output A5,
    output A6,
    output A7,
    output [6:0] cathode
    );
    
    wire a, b, c, d, e, f, g;
    reg [3:0] data;
    wire [2:0] count;
    seg_decoder dec (.D(data), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));
    Segment_LED_Interface I (.clock(clock), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .cathode(cathode), .count(count));
    
    
    always @(D_0, D_1, count)
    begin
        if(count == 0)
        begin
            data <= D_0;
        end
        else if (count == 1)
        begin
            data <= D_1;
        end
    end
    
    
endmodule
