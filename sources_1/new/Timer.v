`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2021 10:00:52 PM
// Design Name: 
// Module Name: Timer
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


module Timer(
    input enable_i,
    input D_done, // deserializer done output
    input reset,
    output reg done_o // when 2 seconds pass
    );
    
    // 17 bit counter
    (* dont_touch = "true" *) reg [16:0] counter;
        
    initial begin
        done_o <= 0;
        counter <= 0;
    end
    
    always @(posedge D_done, posedge reset)
    begin
        if(reset)
        begin
            done_o <= 0;
            counter <= 0;
        end
        else
        begin
            if(enable_i)
            begin
                if(counter == 125000 - 1)
                begin
                    done_o <= 1;
                    counter <= 0;
                end
                else
                begin
                    counter <= counter + 1;
                end            
            end
        end
    end    
endmodule
