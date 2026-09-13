module priority_encoder_2to4 (
    input  logic [3:0] req,   // 4 request lines
    output logic [1:0] enc,  // 2-bit encoded output
    output logic        valid // 1 if any request is active
);

    always_comb begin
        enc   = 2'b00;
        valid = 1'b0;

        // Priority order: req[3] > req[2] > req[1] > req[0]
        if (req[3]) begin
            enc   = 2'b11;
            valid = 1'b1;
        end
        else if (req[2]) begin
            enc   = 2'b10;
            valid = 1'b1;
        end
        else if (req[1]) begin
            enc   = 2'b01;
            valid = 1'b1;
        end
        else if (req[0]) begin
            enc   = 2'b00;
            valid = 1'b1;
        end
    end

endmodule