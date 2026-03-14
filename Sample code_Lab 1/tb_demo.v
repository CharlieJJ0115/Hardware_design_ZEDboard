`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/21 15:30:25
// Design Name: 
// Module Name: tb_demo
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


module tb_demo(

    );

    reg tie_high;
    reg tie_low;
    reg [7:0] sw;
    wire [7:0] led;
    
    integer i;
    
    demo demo(
        .led(led),
        .sw(sw),
        .tie_high(tie_high),
        .tie_low(tie_low)
        );
    
        initial begin
            tie_high = 0; tie_low = 0; sw = 0;
            
            #10;
            tie_high = 1;
            
            #10;
            tie_high = 0; tie_low = 1;
            
            #10;
            tie_low = 0;
            
            for(i=0; i<10; i=i+1) begin
              sw = {$random};
              #10;
        end
        
        $finish;
    end

endmodule
