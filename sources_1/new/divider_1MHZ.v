`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2021 05:24:20 PM
// Design Name: 
// Module Name: divider_1MHZ
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


module divider_1MHZ(
    input clock_i,
    input enable_i,
    output reg clock_o
    );
    
    (* dont_touch = "true" *) reg [5:0] counter;
    
    initial begin
    clock_o <= 0;
    counter <= 0;
    end
    
    // scale the clock
    always @(posedge clock_i)
    begin
        if(enable_i)
        begin
            // divide by 100 to get 1 MHz
            if(counter == 49)
            begin
                counter <= 0;
                clock_o <= ~clock_o;
            end
            else
            begin
                counter <= counter + 1;
            end 
        end
        else
        begin
            clock_o <= 0;            
        end
    end

endmodule
