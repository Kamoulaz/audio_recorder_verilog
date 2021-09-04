`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2021 10:02:36 PM
// Design Name: 
// Module Name: Top_module_tb
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


module Top_module_tb(

    );
    
    reg clock_i, pdm_data_i, Reset, Record, Play, Clip_no_r, Clip_no_p;
    wire pdm_clk_o, pdm_lrsel_o, pdm_audio_o, pdm_sdaudio_o;
    
    
    Top_module UUT(.clock_i(clock_i), .pdm_clk_o(pdm_clk_o), .pdm_data_i(pdm_data_i), .pdm_lrsel_o(pdm_lrsel_o), .pdm_audio_o(pdm_audio_o), .pdm_sdaudio_o(pdm_sdaudio_o), .Reset(Reset), .Record(Record), .Play(Play), .Clip_no_r(Clip_no_r), .Clip_no_p(Clip_no_p));
    
    // generate clock 100 MHz
    always #5 clock_i = ~clock_i;
    
    // data 
    always #1750 pdm_data_i = ~pdm_data_i;
    
    // initial values
    initial begin
        clock_i <= 0;
        pdm_data_i <= 0;
        Reset <= 0;
        Record <= 0;
        Play <= 0;
        Clip_no_r <= 0;
        Clip_no_p <= 0;
    end
    
    // tests
    initial begin
        Reset <= 1;
        #1000
        Reset <= 0;
        Record <= 1;
        #1000
        Record <= 0;
        #16000
        Play <= 1;
    end 
    

endmodule
