clear all
clc

kappa_star      = 2;                  %speed of mean reversion
theta_star      = 0.01/252;           %daily long term variance of v
v0              = 0.01/252;           %daily current variance of underlying
rho             = 0;                  %correlation between dz1 and dz2
T               = 0.5*252;            %time to maturity in days
r               = 0;                  %daily rate of interest
K               = 100;                %strike price of call
S0              = 100;                %current underlying price

sigma           = 0.1/sqrt(252);      %daily volatility of v
S               = 70:130;             %range of spot prices for the graph
V_HSV           = zeros(length(S),1); %vector to store Heston Model Prices
V_BS            = zeros(length(S),1); %vector to store Black Scholes Prices

for i = 1:length(S)
V_HSV(i) = StochVol(S(i),K,sigma,T,r,v0,rho,kappa_star,theta_star);
V_BS(i)  = call_bsm(sqrt(v0),T,S(i),r,K);
end

diff1 = V_HSV - V_BS;                 %difference between prices

sigma           = 0.2/sqrt(252);      %daily volatility of v
S               = 70:130;             %range of spot prices for the graph
V_HSV           = zeros(length(S),1); %vector to store Heston Model Prices
V_BS            = zeros(length(S),1); %vector to store Black Scholes Prices

for i = 1:length(S)
V_HSV(i) = StochVol(S(i),K,sigma,T,r,v0,rho,kappa_star,theta_star);
V_BS(i) = call_bsm(sqrt(v0),T,S(i),r,K);
end

diff2 = V_HSV - V_BS;                 %difference between prices

plot(S,diff1,'r',S,diff2,'b--');      %plot the Figure 4 in Heston(1993)
xlabel('Spot Price')
ylabel('Call Price Difference')
title('Difference between Heston Stochastic Vol Model and Black Scholes')
legend('sigma = 0.1','sigma = 0.2')