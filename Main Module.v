module fir_8tap(input Clk,input signed [15:0]Xin,output reg signed [31:0] Yout);
//Internal variables.
reg signed[15:0]H[100:0];
reg signed [31:0]MCM[100:0];
reg signed [31:0]Q[99:0],add_out[99:0];
integer i;
//flipflop instantiations (for introducing a delay).
task DFLIP;
input signed [31:0]D;
output reg signed [31:0]Q;
Q = D;
endtask
//reading coeffiecients from binary_coeff.txt file to H vector
initial
$readmemb("binary_coeff.txt",H);
always @(posedge Clk)
begin
//filter coefficient initialization
//To avoid floating point arithmetic calculations,all the coefficients are multiplied by 10000
in .txt file itself and all ecg samples are also multiplied by 10000
//Multiple constant multiplications.
for (i=100;i>=0;i=i-1)
MCM[i] = H[i]*Xin;
for (i=0;i<100;i=i+1)
add_out[i]=Q[i]+MCM[100-(i+1)];
DFLIP(MCM[100],Q[0]);
for (i=0;i<99;i=i+1)
DFLIP(add_out[i],Q[i+1]);
Yout = add_out[99];
$display("%d",Yout);
end
endmodule