kappa_star      = 2;                %speed of mean reversion
theta_star      = 0.01/252;         %daily long term variance of v
v0              = 0.01/252;         %daily current variance of underlying
rho             = 0;                %correlation between dz1 and dz2
sigma1          = 0.1/sqrt(252);    %daily volatility of v
sigma2          = 0.2/sqrt(252);    %daily volatility of v
T               = 0.5*252;          %time to maturity in days
r               = 0;                %daily rate of interest 
K               = 100;              %strike price of call
S0              = 100;              %current underlying price
n               = T;                %discretizations of time
N               = 100000;           %number of simulations

valueMC_1 = Heston1993_MC(kappa_star,theta_star,v0,rho,sigma1,T,r,K,S0,n,N)
valueMC_2 = Heston1993_MC(kappa_star,theta_star,v0,rho,sigma2,T,r,K,S0,n,N)

valueF_1  = StochVol(S0,K,sigma1,T,r,v0,rho,kappa_star,theta_star);
valueF_2  = StochVol(S0,K,sigma2,T,r,v0,rho,kappa_star,theta_star);

diff_1    = abs(valueMC_1-valueF_1)
diff_2    = abs(valueMC_2-valueF_2)