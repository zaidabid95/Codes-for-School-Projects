T = 10;
M = 100000;
N = 1000;
S_max = 1;
K = 0.6;
sigma = 0.045;
r = 0.05;
S_0=0;
A = zeros(1,N);
B = zeros(1,N);
C = zeros(1,N);

for i = 1:N
        A(i) = 0.5*(i^2)*(sigma^2)*(T/M) - 0.5*(i)*(r)*(T/M);
        B(i) = 1 - (i^2)*(sigma^2)*(T/M) - (r)*(T/M);
        C(i) = 0.5*(i^2)*(sigma^2)*(T/M) + 0.5*(i)*(r)*(T/M);
end

V_Call1 = zeros(1,N+1);
V_Call2 = zeros(1,N+1);
 
for i = 0:N
    S(i+1) = i*(S_max/N);
    V_Call1(i+1) = max((S(i+1)-K),0);
end

figure
plot(S,V_Call1)
hold on

for j = M:-1:1
V_Call2(1) = 0;
V_Call2(N+1) = S_max - K*exp(-r*(T-(T/j)));      
    for i = 2:N
        V_Call2(i) = A(i)*V_Call1(i-1) + B(i)*V_Call1(i) + C(i)*V_Call1(i+1);
    end
V_Call1 = V_Call2;
end

V_Call = mean(V_Call1)
plot(S,V_Call1)
title('Payoff of Call Option by Finite Difference Scheme')
xlabel('Stock Price')
ylabel('Payoff of Call')
legend('Theoretical', 'FDS')