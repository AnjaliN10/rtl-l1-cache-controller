`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 11:51:00
// Design Name: 
// Module Name: cache_controller
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


module cache_controller(
    input clk,
    input [7:0] address,
    input [31:0] data_in,
    input read,
    input write,
    output [31:0] data_out,
    output hit
);

// Internal wires
wire [3:0] tag;
wire [1:0] index;
wire [1:0] offset;

wire [3:0] tag_out;
wire [31:0] data_cache;

wire hit_internal;
wire valid;
// Instantiate address decoder
address_decoder dec(
    .address(address),
    .tag(tag),
    .index(index),
    .offset(offset)
);

// Instantiate tag array

tag_array tag_mem(
    .clk(clk),
    .write_en(write),
    .index(index),
    .tag_in(tag),
    .tag_out(tag_out),
    .valid_out(valid)
);

// Instantiate data array
data_array data_mem(
    .clk(clk),
    .write_en(write),
    .index(index),
    .data_in(data_in),
    .data_out(data_cache)
);

// Instantiate comparator
comparator comp(
    .tag_cpu(tag),
    .tag_cache(tag_out),
    .valid(valid),
    .hit(hit_internal)
);

// Output assignments
assign hit = hit_internal;
assign data_out = (hit_internal && read) ? data_cache : 32'b0;

endmodule
