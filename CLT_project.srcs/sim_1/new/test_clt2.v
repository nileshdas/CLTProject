`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2019 11:13:22 AM
// Design Name: 
// Module Name: test_clt2
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


module test_clt2;

  wire [31:0] out;
  reg [31:0] Yin;
  reg clk;
  
  integer j;
  integer i=0;  
  CLT abcd(.clk(clk), .Yin(Yin), .out(out), .i(i));
  
    initial clk <= 0;
    always
        begin
        //j = $urandom_range(-120,250);
        #400 clk <= ~clk; i <=i+1; Yin <= 32'd$urandom_range(-120,250) ;
        end 
endmodule
