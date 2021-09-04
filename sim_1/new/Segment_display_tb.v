`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 10:12:49 AM
// Design Name: 
// Module Name: Segment_display_tb
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


module Segment_display_tb(

    );
    
    reg clock_i;
    reg [3:0] digit_0, digit_1;
    
    // generate 100MHz clock
    always #5 clock_i = ~clock_i;

    Segment_display DIS(.D_0(digit_0), .D_1(digit_1), .clock(clock_i), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .cathode(cathode));
    
    initial begin
        clock_i <= 0;
        digit_0 <= 0;
        digit_1 <= 0;
        #100
        digit_0 <= 1;
        #100
        digit_0 <= 0;
        digit_1 <= 1;
    end

endmodule
