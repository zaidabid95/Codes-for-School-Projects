function [Value_Call] = call_bsm(sigma,T,S0,r,K)

d1 = (log(S0/K)+(r+(sigma^(2)/2))*T)/(sigma*sqrt(T));
d2 = d1 - sigma*sqrt(T);

Value_Call = S0*normcdf(d1) - K*exp(-r*T)*normcdf(d2);

end

