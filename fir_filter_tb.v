module fir_filter_tb;

    reg clk;
    reg reset;
    reg [15:0] x;     
    wire [15:0] y;    

	reg [15:0] h[3:0]; 
    integer i;
	
    fir_filter uut (.clk(clk), .reset(reset), .x(x), .y(y));

   
    always begin
        #5 clk = ~clk;  
    end

    initial 
	 begin
       
        clk = 0;
        reset = 1;
        x = 16'd0;
		
		#10 reset = 0;
       
		#10 h[0] = 16'd1;   x = 16'd1;  
        #10 h[1] = 16'd2;  x = 16'd2;  
        #10 h[2] = 16'd3;  x = 16'd3;  
        #10 h[3] = 16'd4;  x = 16'd4;  
       
        $finish;
    end

    initial 
	 begin
        $monitor("At time %t,inputs reset = %d, h[i] = %p, x = %d, Output y = %d", $time,reset,h[i],x,y);
     end
endmodule
