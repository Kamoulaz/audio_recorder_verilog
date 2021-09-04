`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2021 10:19:23 PM
// Design Name: 
// Module Name: Synchronizer
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


module Synchronizer(
    input clock_i,
    input Reset_async,
    input Record_async,
    input Play_async,
    input Clip_no_r_async,
    input Clip_no_p_async,
    output reg Reset,
    output reg Record,
    output reg Play,
    output reg Clip_no_r,
    output reg Clip_no_p
    );
    
    initial begin
        Reset <= 0;
        Record <= 0;
        Play <= 0;
        Clip_no_r <= 0;
        Clip_no_p <= 0;
    end
    
    
    always @(posedge clock_i)
    begin
       if(Reset_async)
       begin
           Reset <= 1;
       end
       else
       begin
           Reset <= 0;
       end
       
       if (Record_async)
       begin
           Record <= 1;
       end
       else
       begin
           Record <= 0;
       end
       
       if (Play_async)
       begin
           Play <= 1;
       end
       else
       begin
           Play <= 0;
       end
       
       if (Clip_no_r_async)
       begin
           Clip_no_r <= 1;
       end
       else
       begin
           Clip_no_r <= 0;
       end
       
       if (Clip_no_p_async)
       begin
           Clip_no_p <= 1;
       end
       else
       begin
           Clip_no_p <= 0;           
       end
    end    
endmodule
