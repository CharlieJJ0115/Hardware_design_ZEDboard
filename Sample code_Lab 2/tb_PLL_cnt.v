`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/22 15:19:23
// Design Name: 
// Module Name: tb_PLL_cnt
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


module tb_PLL_cnt(

    );

    reg ref_clk;
    reg rst;
    reg sw;
    wire [7:0] led;
    
    
    //====================
    // reg clock
    //====================
    initial ref_clk = 0;
    always #5 ref_clk = ~ref_clk;
    
    
    PLL_cnt PLL_cnt(
        .ref_clk(ref_clk),
        .rst(rst),
        .sw(sw),
        .led(led)
        );
    
    initial begin
    rst=1; sw = 0;
    #100;
    rst=0;
    #1000;
    sw = 1;
    
    #1000;
    
    $finish;
    
    end

endmodule
