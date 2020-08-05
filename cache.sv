`timescale 1ns/1ns
module cache(input clk,
        input [127:0] MM_data,
        input [2:0] tag,
        input [9:0] index,
        input [1:0] word_offset,        
         output reg [31:0] cache_data_out,
         output reg hit);
//4 word per line + 4 tag
  reg [131:0] cache_data [1023:0];
  reg [31:0] line [3:0];
  reg valid;
  reg [2:0 ]cache_tag;
  initial begin
   $readmemb ("cache.data", cache_data);
  end
  always@(tag, index, word_offset) begin
      valid = cache_data[index][131];
      cache_tag = cache_data[index][130:128];
      if(valid == 1'b1 & cache_tag == tag) begin
          hit = 1'b1;
          line[0] = cache_data[index][127:96];
          line[1] = cache_data[index][95:64];
          line[2] = cache_data[index][63:32];
          line[3] = cache_data[index][31:0];
          cache_data_out = line[word_offset];
      end
      else begin
        hit = 1'b0;
        cache_data[index] = {1'b1, tag, MM_data};
	      line[0] = cache_data[index][127:96];
	      line[1] = cache_data[index][95:64];
	      line[2] = cache_data[index][63:32];
	      line[3] = cache_data[index][31:0];
	      cache_data_out = line[word_offset];
	      $writememb("cache.data", cache_data);
      end
  end
endmodule
