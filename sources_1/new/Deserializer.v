`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 12:57:39 AM
// Design Name: 
// Module Name: Deserializer
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


module Deserializer(
    input clock_i,
    input enable_i,
    output reg done_o,
    output reg [15:0] data_o,
    output reg pdm_clk_o,
    input pdm_data_i,
    output reg pdm_lrsel_o
    );
        
    // 16 bit register to hold the data
    (* dont_touch = "true" *) reg [15:0] register;
    
    // counter to count 16 clock cycle
    (* dont_touch = "true" *) reg [4:0] shift_count;
    
    wire clock_o;
    // initial values
    initial
    begin
        register <= 0;
        shift_count <= 0;
        
        pdm_lrsel_o <= 0;
        pdm_clk_o <= 0;
        data_o <= 0;
        done_o <= 0;
    end
    
    (* dont_touch = "true" *) divider_1MHZ div (.clock_i(clock_i), .enable_i(enable_i), .clock_o(clock_o));    
    
    always @(clock_o)
    begin
        pdm_clk_o <= clock_o;
    end
    
    // shift the data every 16 clock
    always @(posedge pdm_clk_o)
    begin
        if(enable_i)
        begin
            if(shift_count == 15)
            begin
                data_o <= register;
                shift_count <= 0;
                done_o <= 1;
            end    
            else
            begin
                register <= register >> 1;
                register[15] <= pdm_data_i;
                shift_count <= shift_count + 1;
                done_o <= 0;
                //data_o <= 0;
            end
        end
        else
        begin
            shift_count <= 0;
            done_o <= 0;
        end             
    end
endmodule
