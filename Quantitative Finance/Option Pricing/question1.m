sigma = 0.3;
T = 0.5;
S0 = 100;
r = 0.04;
K = 100;

Value_OnePeriodCall = call_opbm(sigma,T,S0,r,K)
Value_OnePeriodPut = put_opbm(sigma,T,S0,r,K)

Value_TwoPeriodCall = call_tpbm(sigma,T,S0,r,K)
Value_TwoPeriodPut = put_tpbm(sigma,T,S0,r,K)