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
    tie_high, 
    tie_low, 
    sw, 
    led
    );
    
    input tie_high;
    input tie_low;
    input [7:0]sw;
    output reg [7:0]led;
    
    always @(*) begin
        if(tie_high)
            led = 8'hff;
        else if(tie_low)
            led = 8'h00;
        else
            led = sw;
    end
    
endmodule
