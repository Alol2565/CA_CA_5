`timescale 1ns/1ns
module mainmem(input[12:0] address, output reg [127:0] memory_out);
  reg [31:0] memory_data [32767:0];
  initial
  begin
   $readmemb ("main_memory.data", memory_data);
  end
  always@(address) begin
    memory_out = {memory_data[{address,2'b00}], memory_data[{address,2'b01}], memory_data[{address,2'b10}], memory_data[{address,2'b11}]};
  end
endmodule