`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2025 04:45:53 PM
// Design Name: 
// Module Name: may_twenty_two
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
module may_twenty_two(
    output reg [8:0] leds,
    input rst,          
    input clk           
);
    // LED patterns
    localparam led0 = 9'b000000000;
    localparam led1 = 9'b000000001;
    localparam led2 = 9'b000000010;
    localparam led3 = 9'b000000100;
    localparam led4 = 9'b000001000;
    localparam led5 = 9'b000010000;
    localparam led6 = 9'b000100000;
    localparam led7 = 9'b001000000;
    localparam led8 = 9'b010000000;
    localparam led9 = 9'b100000000;
    
    
    parameter CLK_FREQ = 100_000_000;  
    parameter LED_FREQ = 1;            
    
    
    localparam COUNTER_LIMIT = CLK_FREQ / LED_FREQ - 1;
    
    reg [31:0] counter = 0;  
    reg [3:0] number = 0;
    
    always @(posedge clk) begin
        if (rst) begin       
            counter <= 0;
            number <= 0;
            leds <= led0;
        end 
        else begin
            if (counter >= COUNTER_LIMIT) begin
                counter <= 0;
                number <= (number == 9) ? 0 : number + 1;
            end 
            else begin 
                counter <= counter + 1;
            end
            
            case (number)
                0: leds <= led1;
                1: leds <= led2;
                2: leds <= led3;
                3: leds <= led4;
                4: leds <= led5;
                5: leds <= led6;
                6: leds <= led7;
                7: leds <= led8;
                8: leds <= led9;
                9: leds <= led0;
                default: leds <= led0;
            endcase
        end
    end
endmodule
