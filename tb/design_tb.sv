`timescale 1ns/1ps

module priority_encoder_2to4_tb;
    logic [3:0] req;
    logic [1:0] enc;
    logic       valid;

    priority_encoder_2to4 dut (
        .req(req),
        .enc(enc),
        .valid(valid)
    );

    initial begin
        // Enable VCD dumping for submission
        $dumpfile("waveform.vcd");
        $dumpvars(0, priority_encoder_2to4_tb);

        $display("req = %b, enc = %b, valid = %b", req, enc, valid);

        // No input request
        req = 4'b0000;
        #10;
        $display("Case 1: req=%b enc=%b valid=%b", req, enc, valid);

        // Lowest priority request
        req = 4'b0001;
        #10;
        $display("Case 2: req=%b enc=%b valid=%b", req, enc, valid);

        // Middle request
        req = 4'b0010;
        #10;
        $display("Case 3: req=%b enc=%b valid=%b", req, enc, valid);

        // Higher request
        req = 4'b0100;
        #10;
        $display("Case 4: req=%b enc=%b valid=%b", req, enc, valid);

        // Highest request
        req = 4'b1000;
        #10;
        $display("Case 5: req=%b enc=%b valid=%b", req, enc, valid);

        // Multiple requests: highest priority wins
        req = 4'b1100;
        #10;
        $display("Case 6: req=%b enc=%b valid=%b", req, enc, valid);

        $finish;
    end
endmodule