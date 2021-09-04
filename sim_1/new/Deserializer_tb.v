`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 02:27:59 AM
// Design Name: 
// Module Name: Deserializer_tb
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


module Deserializer_tb(

    );
    
    reg clock_i, enable_i, pdm_data_i;
    wire [15:0] data_o;
    wire done_o, pdm_clk_o, pdm_lrsel_o;
    
    // inistantiate the module under test
    Deserializer UUT (.clock_i(clock_i), .enable_i(enable_i), .done_o(done_o), .data_o(data_o), .pdm_clk_o(pdm_clk_o), .pdm_data_i(pdm_data_i), .pdm_lrsel_o(pdm_lrsel_o));
    
    // generate 100MHz clock
    always #5 clock_i = ~clock_i;
    
    // tests
    initial begin
        clock_i <= 0;
        #10 enable_i <= 1;
        pdm_data_i <= 1;
    end
    
    
endmodule
