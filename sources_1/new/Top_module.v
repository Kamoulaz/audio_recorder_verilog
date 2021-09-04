`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2021 11:50:57 PM
// Design Name: 
// Module Name: Top_module
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


module Top_module(
    input clock_i,
    output pdm_clk_o,
    input pdm_data_i,
    output pdm_lrsel_o,
    inout pdm_audio_o,
    output pdm_sdaudio_o,
    input Reset,
    input Record,
    input Play,
    input Clip_no_r,
    input Clip_no_p,
    output A0,
    output A1,
    output A2,
    output A3,
    output A4,
    output A5,
    output A6,
    output A7,
    output [6:0] cathode,
    output reg LED    
    );
    
    // wires
    wire D_enable, D_done, S_enable, one_done, mem1_enable, mem2_enable, mem_w_enable, timer_enable, timer_reset, timer_done, reset, record, play, clip_no_r, clip_no_p;
    wire [15:0] D_data_o, mem_data_o_0, mem_data_o_1;
    wire [16:0] mem_addr;
    reg [15:0] mem_data_o;
    reg [3:0] digit_0, digit_1;
    
    // instantiate the modules
    (* dont_touch = "true" *) Deserializer D(.clock_i(clock_i), .enable_i(D_enable), .done_o(D_done), .data_o(D_data_o), .pdm_clk_o(pdm_clk_o), .pdm_data_i(pdm_data_i), .pdm_lrsel_o(pdm_lrsel_o));
    (* dont_touch = "true" *) blk_mem_gen_0 mem1(.clka(clock_i), .ena(mem1_enable), .wea(mem_w_enable), .addra(mem_addr), .dina(D_data_o), .douta(mem_data_o_0));    
    (* dont_touch = "true" *) blk_mem_gen_1 mem2(.clka(clock_i), .ena(mem2_enable), .wea(mem_w_enable), .addra(mem_addr), .dina(D_data_o), .douta(mem_data_o_1));
    (* dont_touch = "true" *) Serializer S(.clock_i(clock_i), .enable_i(S_enable), .done_o(S_done), .data_i(mem_data_o), .pdm_audio_o(pdm_audio_o), .pdm_sdaudio_o(pdm_sdaudio_o));
    (* dont_touch = "true" *) Timer T(.enable_i(timer_enable), .D_done(D_done), .reset(timer_reset), .done_o(timer_done));
    (* dont_touch = "true" *) Synchronizer SY(.clock_i(clock_i), .Reset_async(Reset), .Record_async(Record), .Play_async(Play), .Clip_no_r_async(Clip_no_r), .Clip_no_p_async(Clip_no_p), .Reset(reset), .Record(record), .Play(play), .Clip_no_r(clip_no_r), .Clip_no_p(clip_no_p));    
    (* dont_touch = "true" *) Controller C(.clock_i(clock_i), .Reset(reset), .Record(record), .Play(play), .Clip_no_r(clip_no_r), .Clip_no_p(clip_no_p), .one_done(D_done), .timer_reset(timer_reset), .timer_enable(timer_enable), .timer_done(timer_done), .D_enable(D_enable), .S_enable(S_enable), .mem1_enable(mem1_enable), .mem2_enable(mem2_enable), .mem_w_enable(mem_w_enable), .mem_addr(mem_addr));

    (* dont_touch = "true" *) Segment_display DIS(.D_0(digit_0), .D_1(digit_1), .clock(clock_i), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .cathode(cathode));
    
    // Mux for mem data out
    always @(clip_no_p, mem_data_o_1, mem_data_o_0)
    begin
        if(clip_no_p)
        begin
            mem_data_o = mem_data_o_1;
        end
        else
        begin
            mem_data_o = mem_data_o_0;
        end
    end
    
    always @(clip_no_p, clip_no_r)
    begin
        if(clip_no_p)
        begin
            digit_0 <= 1;
        end
        else
        begin
            digit_0 <= 0;
        end

        if(clip_no_r)
        begin
            digit_1 <= 1;
        end
        else
        begin
            digit_1 <= 0;
        end        
    end
    
    always @(D_enable)
    begin
        LED <= D_enable;
    end
endmodule
