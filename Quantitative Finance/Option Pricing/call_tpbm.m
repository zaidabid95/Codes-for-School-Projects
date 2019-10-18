function [Value_Call] = call_tpbm(sigma,T,S0,r,K)

u = exp(sigma*sqrt(T/2));
d = u^(-1);

prob_u = (exp(r*T/2)-d)/(u-d);
prob_d = 1 - prob_u;

Suu = S0*u*u;
Sud = S0*u*d;
Sdd = S0*d*d;

payoff_uu = max(0,Suu-K);
payoff_ud = max(0,Sud-K);
payoff_dd = max(0,Sdd-K);

payoff_u = (prob_u*payoff_uu + prob_d*payoff_ud)*exp(-r*T/2);
payoff_d = (prob_u*payoff_ud + prob_d*payoff_dd)*exp(-r*T/2);

exp_payoff = (prob_u*payoff_u + prob_d*payoff_d);

Value_Call = exp_payoff * exp(-r*T/2);

end