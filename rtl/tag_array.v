`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 11:36:11
// Design Name: 
// Module Name: tag_array
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


module tag_array(
    input clk,
    input write_en,
    input [1:0] index,
    input [3:0] tag_in,
    output reg [3:0] tag_out,
    output reg valid_out
);

reg [3:0] tag_mem [0:3];
reg valid_mem [0:3];

// Write
always @(posedge clk) begin
    if (write_en) begin
        tag_mem[index] <= tag_in;
        valid_mem[index] <= 1'b1;
    end
end

// Read
always @(*) begin
    tag_out = tag_mem[index];
    valid_out = valid_mem[index];
end

endmodule
