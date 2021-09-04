`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 06:06:18 PM
// Design Name: 
// Module Name: Serializer
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


module Serializer(
    input clock_i,
    input enable_i,
    output reg done_o,
    input [15:0] data_i,
    output reg pdm_audio_o,
    output reg pdm_sdaudio_o
    );
    
    (* dont_touch = "true" *) reg [4:0] shift_counter;
    (* dont_touch = "true" *) reg [15:0] data;
    wire clock_o;
    
    
    (* dont_touch = "true" *) divider_1MHZ div (.clock_i(clock_i), .enable_i(enable_i), .clock_o(clock_o));    

    initial
    begin
        shift_counter <= 0;
        pdm_sdaudio_o <= 1;
        done_o <= 0;
        pdm_audio_o <= 0;
        data <= 0;
    end




     always @(posedge clock_o)
     begin
        if(enable_i)
        begin
            if(shift_counter == 15)
            begin
                done_o <= 1;
                shift_counter <= 0;
                pdm_audio_o <= 0;
            end
            else if(shift_counter == 0)
            begin
                data <= data_i;
                shift_counter <= shift_counter + 1;
            end

            else
            begin                
                done_o <= 0;
                shift_counter <= shift_counter + 1;
                
//                if(data[0] == 1)
//                begin
//                    pdm_audio_o <= 1'bz;
//                end
//                else
//                begin
//                    pdm_audio_o <= 1'b0;
//                end
                
                pdm_audio_o <= data[0];
                data <= data >> 1;
            end
        end
        else
        begin
            pdm_audio_o <= 0;
        end
    end  
    
endmodule
