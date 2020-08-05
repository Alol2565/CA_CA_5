`timescale 1ns/1ns
module mainmem(input[12:0] address, input clk,rst, output reg [127:0] memory_out);
  reg [31:0] memoryData [32767:0];
  initial
  begin
   $readmemb ("main_memory.data", memoryData);
  end
  always@(address) begin
    memory_out = {memoryData[{address,2'b00}], memoryData[{init_address,2'b01}], memoryData[{init_address,2'b10}], memoryData[{init_address,2'b11}]};
  end
endmodule