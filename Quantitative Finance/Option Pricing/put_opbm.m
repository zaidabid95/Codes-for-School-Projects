function [Value_Put] = put_opbm(sigma,T,S0,r,K)

u = exp(sigma*sqrt(T));
d = u^(-1);

prob_u = (exp(r*T)-d)/(u-d);
prob_d = 1 - prob_u;

Su = S0*u;
Sd = S0*d;

payoff_u = max(0,K-Su);
payoff_d = max(0,K-Sd);

exp_payoff = prob_u*payoff_u + prob_d*payoff_d;

Value_Put = exp_payoff * exp(-r*T);

end