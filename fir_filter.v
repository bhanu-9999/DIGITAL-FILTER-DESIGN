module fir_filter (
    input clk,                
    input reset,              
    input [15:0] x,            
    output reg [15:0] y            
);

    reg [15:0] h[3:0];              
    reg [15:0] shift_reg[3:0];       

    reg [31:0] accumulator;         

    initial 
	 begin
        h[0] = 16'd1;  
        h[1] = 16'd2;  
        h[2] = 16'd3;  
        h[3] = 16'd4;  
     end

    always @(posedge clk or posedge reset) begin
        if (reset) begin

            shift_reg[0] <= 16'd0;
            shift_reg[1] <= 16'd0;
            shift_reg[2] <= 16'd0;
            shift_reg[3] <= 16'd0;
            accumulator <= 32'd0;
        end else begin
           
            shift_reg[0] <= x;
            shift_reg[1] <= shift_reg[0];
            shift_reg[2] <= shift_reg[1];
            shift_reg[3] <= shift_reg[2];

            
            accumulator <= (h[0] * shift_reg[0]) +
                          (h[1] * shift_reg[1]) +
                          (h[2] * shift_reg[2]) +
                          (h[3] * shift_reg[3]);
        end
    end

  
    assign y = accumulator[15:0];  

endmodule
