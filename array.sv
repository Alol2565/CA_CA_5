`timescale 1ns/1ns
module array(clk, address);
    output reg [14:0] address;
    input clk;
    initial address = 15'd1023;
    always@(posedge clk) begin 
        if(address < 9216) begin
            address <= address + 15'd1;
        end
    end  
endmodule

