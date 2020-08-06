`timescale 1ns/1ns
module tb();
  reg clk;
  wire [31:0] output_data;
  initial begin
  clk = 1;
  end
  always
    #50 clk = !clk;
  datapath datapath(clk, output_data);
endmodule
