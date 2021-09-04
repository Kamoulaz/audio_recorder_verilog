`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 12:40:44 AM
// Design Name: 
// Module Name: 7-seg-decoder
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


module seg_decoder(
    input [3:0] D,
    output reg a,
    output reg b,
    output reg c,
    output reg d,
    output reg e,
    output reg f,
    output reg g
    );
   
   initial begin
       a <= 1;
       b <= 1;
       c <= 1;
       d <= 1;
       e <= 1;
       f <= 1;
       g <= 1;
   end
    
    always @(D)
        case (D)
          4'h0:
            begin
                a <= 0;
                b <= 0;
                c <= 0;
                d <= 0;
                e <= 0;
                f <= 0;
                g <= 1;
            end
          4'h1:
            begin
                a <= 1;
                b <= 0;
                c <= 0;
                d <= 1;
                e <= 1;
                f <= 1;
                g <= 1;
            end
          4'h2:
            begin
                a <= 0;
                b <= 0;
                c <= 1;
                d <= 0;
                e <= 0;
                f <= 1;
                g <= 0;
            end
          4'h3:
            begin
                a <= 0;
                b <= 0;
                c <= 0;
                d <= 0;
                e <= 1;
                f <= 1;
                g <= 0;
            end
          4'h4:
            begin
                a <= 1;
                b <= 0;
                c <= 0;
                d <= 1;
                e <= 1;
                f <= 0;
                g <= 0;
            end
          4'h5:
            begin
                a <= 0;
                b <= 1;
                c <= 0;
                d <= 0;
                e <= 1;
                f <= 0;
                g <= 0;
            end
          4'h6:
            begin
                a <= 0;
                b <= 1;
                c <= 0;
                d <= 0;
                e <= 0;
                f <= 0;
                g <= 0;
            end
          4'h7:
            begin
                a <= 0;
                b <= 0;
                c <= 0;
                d <= 1;
                e <= 1;
                f <= 1;
                g <= 1;
            end
          4'h8:
            begin
                a <= 0;
                b <= 0;
                c <= 0;
                d <= 0;
                e <= 0;
                f <= 0;
                g <= 0;            
            end
          4'h9:
            begin
                a <= 0;
                b <= 0;
                c <= 0;
                d <= 1;
                e <= 1;
                f <= 0;
                g <= 0;
            end
        endcase    
endmodule
