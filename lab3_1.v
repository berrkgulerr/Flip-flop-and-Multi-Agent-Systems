`timescale 1ns / 1ps

module sf(
    input S,
    input F,
    input clk,
    output reg Q
    );
    
    initial begin
        Q = 0;
    end
	
    // write your code here
	 always@(posedge clk)
		if(S == 1 && F == 1) Q <= !Q ;
		else if(S == 0 && F == 1) Q <= 1;
		else if(S == 1 && F == 0) Q <= Q;
		else Q <= 0;
	 
	 
endmodule


module ic1500(
    input B, 
    input A, 
    input X, 
	 input clk,
	 output D0,
	 output D1,
	 output Q,
    output Z
    );
    // write your code here
	 assign D1 = ((A&(~B)&(~X)) | ((~A)&B&(~X)));
	 assign D0 = (X | (A&(~B)));
	 sf icl(.S(D1), .F(D0), .clk(clk), .Q(Q));
	 assign Z = (X & icl.Q);
	
endmodule
