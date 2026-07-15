// MATRIX MULTIPLICATION ACCELERATOR WITH DISPLAY


module mac1
#(
    parameter N  = 4,
    parameter DW = 8
)
(
    input clk,

    output reg [6:0] HEX0,
    output reg [6:0] HEX1,
    output reg [6:0] HEX2,
    output reg [6:0] HEX3,
    output reg [6:0] HEX4
);

// MATRIX STORAGE


reg signed [DW-1:0] A [0:N-1][0:N-1];//2D ARRAY(MATRIX)
reg signed [DW-1:0] B [0:N-1][0:N-1];
reg signed [2*DW+4:0] C [0:N-1][0:N-1];//at the time of  accumulation ,to prevent overflow(overflow occurs bcz here we are doing N additions) a we add N here 4.

integer i,j,k;


// MATRIX INITIALIZATION

initial
begin

A[0][0] = 30;
A[0][1] = 17;
A[0][2] = 26;
A[0][3] = 17;
A[1][0] = 82;
A[1][1] = 41;
A[1][2] = 62;
A[1][3] = 41;
A[2][0] = 14;
A[2][1] = 11;
A[2][2] = 18;
A[2][3] = 7;
A[3][0] = 43;
A[3][1] = 12;
A[3][2] = 27;
A[3][3] = 12;

B[0][0] = 30;
B[0][1] = 17;
B[0][2] = 26;
B[0][3] = 17;
B[1][0] = 82;
B[1][1] = 41;
B[1][2] = 62;
B[1][3] = 41;
B[2][0] = 14;
B[2][1] = 11;
B[2][2] = 18;
B[2][3] = 7;
B[3][0] = 43;
B[3][1] = 12;
B[3][2] = 27;
B[3][3] = 12;

end



// PARALLEL MULTIPLIERS


wire signed [2*DW-1:0] mult [0:N-1][0:N-1][0:N-1];

genvar r,c,t;

generate

for(r=0; r<N; r=r+1)//creates N hardware blocks one for each row of matrix c
begin: ROW_BLOCK

    for(c=0; c<N; c=c+1)// creates N hardware blocks for each column
    begin: COL_BLOCK

        for(t=0; t<N; t=t+1)//generates N multiplier each element of c
        begin: MULT_BLOCK

            assign mult[r][c][t] = A[r][t] * B[t][c];

        end

    end

end

endgenerate



// MAC( ACCUMULATION )

reg signed [2*DW+4:0] sum;

always @(posedge clk)
begin

for(i=0;i<N;i=i+1)
begin
    for(j=0;j<N;j=j+1)
    begin

        sum = 0;

        for(k=0;k<N;k=k+1)
            sum = sum + mult[i][j][k];

        C[i][j] <= sum;

    end
end

end
//

// RESULT SELECTION

reg [7:0] state = 0;
reg start = 0;

reg signed [2*DW+4:0] value;

always @(posedge clk)
begin

if(start == 0)
begin
    start <= 1;   // wait one cycle for C matrix to compute
    state <= 0;
end

else
begin

    value <= C[state / N][state % N];

    if(state == (N*N - 1))
        state <= 0;
    else
        state <= state + 1;

end

end


// BINARY TO DECIMAL DIGITS

integer temp;

reg [3:0] d0,d1,d2,d3,d4;

always @(*)
begin

temp = value;

d0 = temp % 10;
temp = temp / 10;

d1 = temp % 10;
temp = temp / 10;

d2 = temp % 10;
temp = temp / 10;

d3 = temp % 10;
temp = temp / 10;

d4 = temp % 10;

end


// 7 SEGMENT DECODER

function [6:0] seg;

input [3:0] digit;

begin

case(digit)

0: seg = 7'b1000000;
1: seg = 7'b1111001;
2: seg = 7'b0100100;
3: seg = 7'b0110000;
4: seg = 7'b0011001;
5: seg = 7'b0010010;
6: seg = 7'b0000010;
7: seg = 7'b1111000;
8: seg = 7'b0000000;
9: seg = 7'b0010000;

default: seg = 7'b1111111;

endcase

end

endfunction


// DISPLAY OUTPUT

always @(*)
begin

HEX0 = seg(d0);
HEX1 = seg(d1);
HEX2 = seg(d2);
HEX3 = seg(d3);
HEX4 = seg(d4);

end

endmodule







