`timescale 1ns/1ps

module cache_tb;

// Inputs
reg clk;
reg [7:0] address;
reg [31:0] data_in;
reg read;
reg write;

// Outputs
wire [31:0] data_out;
wire hit;

// Instantiate cache controller
cache_controller uut (
    .clk(clk),
    .address(address),
    .data_in(data_in),
    .read(read),
    .write(write),
    .data_out(data_out),
    .hit(hit)
);

// Clock generation
always #5 clk = ~clk;

// Test sequence
initial begin
    // Initialize
    clk = 0;
    address = 0;
    data_in = 0;
    read = 0;
    write = 0;

    // ---------------------------
    // Write to cache (MISS)
    // ---------------------------
    #10;
    address = 8'b10110010;   // some address
    data_in = 32'hAABBCCDD;
    write = 1;
    read = 0;

    #10;
    write = 0;

    // ---------------------------
    // Read same address (HIT)
    // ---------------------------
    #10;
    address = 8'b10110010;
    read = 1;

    #10;
    read = 0;

    // ---------------------------
    // New address (MISS)
    // ---------------------------
    #10;
    address = 8'b11110000;
    read = 1;

    #10;
    read = 0;

    // Finish simulation
    #20;
    $finish;
end

endmodule