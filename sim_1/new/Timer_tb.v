`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 10:31:49 AM
// Design Name: 
// Module Name: Timer_tb
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


module Timer_tb(

    );
    reg timer_reset, D_done;
    wire timer_done;
    
    
    Timer T(.reset(timer_reset), .D_done(D_done), .done_o(timer_done));

    
    initial begin
        timer_reset = 0;
        D_done <= 0;
    end

    always #1 D_done <= ~ D_done;
    
    initial begin
        #100
        timer_reset <= 1;
        #10
        timer_reset <= 0; 
    end
endmodule
