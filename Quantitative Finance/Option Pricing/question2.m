sigma = 0.3;
T = 0.5;
S0 = 100;
r = 0.04;
K = 100;

Value_Call = call_bsm(sigma,T,S0,r,K)
Value_Put = put_bsm(sigma,T,S0,r,K)