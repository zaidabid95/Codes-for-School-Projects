lambda_star = -0.5;             %The risk neutral lamda (risk premiuim)
S0          = 100;              %The spot price
K           = 100;              %The strike price
h0          = (0.15*0.15)/252;  %The inital conditional variance
T1          = 50;               %The time to maturiy for the first option
T2          = 100;              %The time to maturity for the second option
n           = 10000;            %The number of time steps
N           = 100000;           %The number of simulations
alpha1      = 1.32*10^(-6);     %The kurtosis (speed of mean reversion)
beta1       = 0.589;            %The annual long term variance of h
gamma1      = 421.39;           %The skewness of the distribution
omega           = 5.02*10^(-6);     %The intercept of the conditional varaince
lambda      = 0.205;            %The risk premium
r           = 0;                %The risk free rate

p_MC(1) = GARCH2000_MC(T1,r,K,S0,h0,T1,n,lambda,lambda_star,alpha1,beta1,gamma1,omega);
p_MC(2) = GARCH2000_MC(T2,r,K,S0,h0,T2,n,lambda,lambda_star,alpha1,beta1,gamma1,omega)

p(1) = NandiGARCH(S0,K,h0,T1,r,lambda_star,alpha1,beta1,gamma1,lambda,omega);
p(2) = NandiGARCH(S0,K,h0,T2,r,lambda_star,alpha1,beta1,gamma1,lambda,omega);

diff_bw_MC_Formula = max(abs(p_MC-p))