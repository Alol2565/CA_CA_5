`timescale 1ns/1ns
module tb();
  
  reg rst,clk;
  wire [31:0] output_data, hit_number;
  initial begin
  clk = 1;
  end
  always
    #50 clk = !clk;
  datapath datapath(clk, output_data);
  // initial begin
  //  rst =  1;
  //  #120
  //  rst = 0;
  // // #30
  // // RegWrite = 1;
  // // WriteData = 32'd21;
  // // #100
  // // RegWrite = 0;
   
   
  // end
endmodule
