`timescale 1ns/1ns

module datapath(input clk, output reg [31:0] output_data);
  wire [14:0] address;
  wire [2:0] tag;
  wire [9:0] index;
  wire [1:0] word_offset;
  wire [127:0] memory_out;
  wire [12:0] prime_address;
  wire [31:0] cache_data_out;
  wire hit;
  integer hit_number = 0;
  integer access_number = 0;
  integer hit_rate = 0;
  assign output_data = cache_data_out;
  array array (clk, address);
  AddressDecoder AddressDecoder (address, tag, index, word_offset, prime_address);
  mainmem mainmem (prime_address, memory_out);
  cache cache (clk, memory_out, tag, index, word_offset, cache_data_out,hit);
  always@(negedge clk) begin
    if(hit) hit_number = hit_number + 1;
    if (access_number < 8192) access_number = access_number + 1;
  end
endmodule