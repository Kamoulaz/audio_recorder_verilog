`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2021 01:23:21 AM
// Design Name: 
// Module Name: Serializer_tb
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


module Serializer_tb(

    );
    
    reg clock_i, enable_i;
    reg [15:0] data_i;
    wire done_o, pdm_audio_o, pdm_sdaudio_o;  
    
    // instance creation
    Serializer UUT(.clock_i(clock_i), .enable_i(enable_i), .done_o(done_o), .data_i(data_i), .pdm_audio_o(pdm_audio_o), .pdm_sdaudio_o(pdm_sdaudio_o));

    // generate 100MHz clock
    always #5 clock_i = ~clock_i;
    
    initial
    begin
        clock_i = 0;
        enable_i = 1;
        data_i <= 1;
        #16000
        data_i <= 20;
        #16000
        data_i <= 0;
    end

endmodule
