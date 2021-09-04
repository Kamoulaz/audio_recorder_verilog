`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2021 06:27:43 PM
// Design Name: 
// Module Name: div_tb
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


module div_tb(

    );
    
    reg clock_i, enable_i;
    wire clock_o;
    
    divider_1MHZ div (.clock_i(clock_i), .enable_i(enable_i), .clock_o(clock_o));
    
    initial begin
        clock_i <= 0;
        enable_i <= 1;
    end
    
    always #5 clock_i = ~clock_i;

endmodule
