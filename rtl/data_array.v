`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 11:40:52
// Design Name: 
// Module Name: data_array
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


module data_array(
    input clk,
    input write_en,
    input [1:0] index,
    input [31:0] data_in,
    output reg [31:0] data_out
);

// 4 cache lines, each stores 32-bit data
reg [31:0] data_mem [0:3];

// Write operation
always @(posedge clk) begin
    if (write_en)
        data_mem[index] <= data_in;
end

// Read operation
always @(*) begin
    data_out = data_mem[index];
end

endmodule
