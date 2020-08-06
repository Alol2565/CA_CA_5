module AddressDecoder(input [14:0] address, 
    output reg [2:0] tag,
    output reg [9:0] index,
    output reg [1:0] word_offset);
    assign word_offset = address[1:0];
    assign index = address[11:2];
    assign tag = address[14:12];
  endmodule
