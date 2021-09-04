`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2015 02:55:43 PM
// Design Name: 
// Module Name: Segment_LED_Interface
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


module Segment_LED_Interface(
    clock,
    a,
    b,
    c,
    d,
    e,
    f,
    g,
    A0,
    A1,
    A2,
    A3,
    A4,
    A5,
    A6,
    A7,
    cathode,
    count
    );
    
 input clock;
 input a;
 input b;
 input c;
 input d;
 input e;
 input f;
 input g;
 
 output reg A0;
 output reg A1;
 output reg A2;
 output reg A3;
 output reg A4;
 output reg A5;
 output reg A6;
 output reg A7;
 output reg [6:0] cathode;
 output reg [2:0] count = 3'b000;
 
 reg[23:0] clock_count = 0;
 wire clock_sig;
 wire [6:0] Digit;
 
 assign Digit[0] = g;
 assign Digit[1] = f;
 assign Digit[2] = e;
 assign Digit[3] = d;
 assign Digit[4] = c;
 assign Digit[5] = b;
 assign Digit[6] = a;  
 
 always@(posedge clock)
  begin
    clock_count <= clock_count + 1;
  end
  
 assign clock_sig = clock_count[17];
 
 always@(posedge clock_sig)
 begin
    count <= count + 1;
 end 
 
 always@(count)
 begin
    A0 <= 1'b1;
    A1 <= 1'b1;
    A2 <= 1'b1;
    A3 <= 1'b1;
    A4 <= 1'b1;
    A5 <= 1'b1;
    A6 <= 1'b1;
    A7 <= 1'b1;
   case(count)
       
        0:
        begin
          A0 <= 1'b0;  
          cathode <= Digit;   
        end
        
        1:
        begin
            A1 <= 1'b0;
            cathode <= Digit;
        end
        
        2:
        begin
            A2 <= 1'b0;
            cathode <= 7'b1111111;
        end
        
        3:
        begin
            A3 <= 1'b0;
            cathode <= 7'b1111111;
        end
       
        4:
        begin
            A4 <= 1'b0;
            cathode <= 7'b1111111;
        end
       
        5:
        begin
            A5 <= 1'b0;
            cathode <= 7'b1111111;
        end
       
        6:
        begin
            A6 <= 1'b0;
            cathode <= 7'b1111111;
        end
       
        7:
        begin
            A7 <= 1'b0;
            cathode <= 7'b1111111;
        end
    endcase
 end
 
endmodule
