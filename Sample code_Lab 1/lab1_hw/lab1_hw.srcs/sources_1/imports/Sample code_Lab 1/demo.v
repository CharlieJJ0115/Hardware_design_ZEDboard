`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2021 04:34:13 PM
// Design Name: 
// Module Name: demo
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


module demo( 
    BTNL, 
    BTNR, 
    sw, 
    LED
    );
    
    input BTNL;
    input BTNR;
    input [7:0]sw;
    output reg [7:0] LED;
    
    always @(*) begin
        if(BTNL)
            LED[7:4] = 4'b1111;
        else 
            LED[7:4] = sw[7:4];

        if (BTNR)
            LED[3:0] = 4'b1111;
        else 
            LED[3:0] = sw[3:0];
    end
    
endmodule
