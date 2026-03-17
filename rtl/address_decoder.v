`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 11:21:58
// Design Name: 
// Module Name: address_decoder
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


module address_decoder(
    input  [7:0] address,
    output [3:0] tag,
    output [1:0] index,
    output [1:0] offset
);

assign tag    = address[7:4];
assign index  = address[3:2];
assign offset = address[1:0];

endmodule
