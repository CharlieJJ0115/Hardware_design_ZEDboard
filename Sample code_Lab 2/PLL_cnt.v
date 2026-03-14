`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/22 14:40:54
// Design Name: 
// Module Name: PLL_cnt
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


module PLL_cnt(
    ref_clk,
    rst,
    sw,
    led
    );

    input ref_clk;
    input rst;
    input sw;
    output reg [7:0] led;
    
    wire clk1;
    wire clk2;
    wire locked;
    
    clk_wiz_0 clk_wiz_0
    (
        // Clock in ports
        .clk_in1(ref_clk),
        // Clock out ports
        .clk_out1(clk1),
        .clk_out2(clk2),
        // Status and control signals
        .reset(rst),
        .locked(locked)
    );


    reg [40:0] cnt_clk1;
    reg [40:0] cnt_clk2;
    
    parameter led_plus = 100000000;
    
    
    always @ (posedge clk1 or posedge rst) begin
        if(rst)
            cnt_clk1 <= 0;
        else if(cnt_clk1 == led_plus)
            cnt_clk1 <= 0;
        else
            cnt_clk1 <= cnt_clk1 + 1;
    end

    always @ (posedge clk2 or posedge rst) begin
        if(rst)
            cnt_clk2 <= 0;
        else if(cnt_clk2 == led_plus)
            cnt_clk2 <= 0;
        else
            cnt_clk2 <= cnt_clk2 + 1;
    end


    always @ (posedge clk2 or posedge rst) begin
        if(rst)
            led <= 0;
        else if( !sw && cnt_clk1_clk2_d == led_plus && cnt_clk1_clk2_d == cnt_clk1_clk2)
            led <= led + 1;
        else if( sw && cnt_clk2 == led_plus)
            led <= led + 1;
    end

    reg [40:0] cnt_clk1_clk2;

    always @ (posedge clk2 or posedge rst) begin
        if(rst)
            cnt_clk1_clk2 <= 0;
        else
            cnt_clk1_clk2 <= cnt_clk1;
    end

    reg [40:0] cnt_clk1_clk2_d;

    always @ (posedge clk2 or posedge rst) begin
        if(rst)
            cnt_clk1_clk2_d <= 0;
        else
            cnt_clk1_clk2_d <= cnt_clk1_clk2;
    end

endmodule
