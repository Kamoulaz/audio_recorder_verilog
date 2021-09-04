`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2021 11:03:59 PM
// Design Name: 
// Module Name: Controller
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


module Controller(
    input clock_i,
    input Reset,
    input Record,
    input Play,
    input Clip_no_r,
    input Clip_no_p,
    input one_done,
    output reg timer_reset,
    output reg timer_enable,
    input timer_done,
    output reg D_enable,
    output reg S_enable,
    output reg mem1_enable,
    output reg mem2_enable,
    output reg mem_w_enable,
    output reg [16:0] mem_addr
    );
    
    // current state
    (* dont_touch = "true" *) reg [1:0] state;
    
    // initial values
    initial begin
        state <= 0;
        timer_enable <= 0;
        timer_reset <= 0;
        D_enable <= 0;
        S_enable <= 0;
        mem1_enable <= 0;
        mem2_enable <= 0;
        mem_w_enable <= 0;
        mem_addr <= 0;
    end
    
    always @(posedge clock_i)
    begin
        if (Reset | timer_done)
        begin
            state <= 0;
        end
        
        else
        begin
            case(state)
            // reset state
            2'b00 : begin
               if(Record)
               begin
                   state <= 1;
               end
               else if (Play)
               begin
                   state <= 2;
               end                
            end
            
            // record state
            2'b01: begin
                state <= 1;
            end

            // play state
            2'b10: begin
                state <= 2;
            end
            endcase
        end
    end
    
    always @(posedge clock_i)
    begin
        if (state == 0)
        begin
            timer_enable <= 0;
            timer_reset <= 1;
            D_enable <= 0;
            S_enable <= 0;
            mem1_enable <= 0;
            mem2_enable <= 0;
            mem_w_enable <= 0;
        end
        else if (state == 1)
        begin
            timer_enable <= 1;
            timer_reset <= 0;
            D_enable <= 1;
            mem_w_enable <= 1;
            
            if(Clip_no_r)
            begin
                mem2_enable <= 1;
            end
            else
            begin
                mem1_enable <= 1;
            end                    
        end
        else if (state == 2)
        begin
            timer_enable <= 1;
            timer_reset <= 0;
            mem_w_enable <= 0;

            S_enable <= 1;
            D_enable <= 1;
            
            if(Clip_no_p)
            begin
                mem2_enable <= 1;
            end
            else
            begin
                mem1_enable <= 1;
            end                   
        end
    end    
    
    always @(posedge one_done, posedge timer_done)
    begin
        if(timer_done)
        begin
            mem_addr <= 0;        
        end
        else
        begin
            mem_addr <= mem_addr + 1;
        end
    end

endmodule
