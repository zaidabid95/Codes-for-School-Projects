T = 10;
M = 100000;
N = 1000;
S_max = 1;
K = 0.6;
sigma = 0.045;
r = 0.05;

A = zeros(1,N);
B = zeros(1,N);
C = zeros(1,N);

for i = 1:N
        A(i) = 0.5*(i^2)*(sigma^2)*(T/M) - 0.5*(i)*(r)*(T/M);
        B(i) = 1 - (i^2)*(sigma^2)*(T/M) - (r)*(T/M);
        C(i) = 0.5*(i^2)*(sigma^2)*(T/M) + 0.5*(i)*(r)*(T/M);
end

V_Put1 = zeros(1,N+1);
V_Put2 = zeros(1,N+1);
 
for i = 0:N
    S(i+1) = i*(S_max/N);
    V_Put1(i+1) = max((K-S(i+1)),0);
end

plot(S,V_Put1)
hold on

for j = M:-1:1
V_Put2(1) = (1-r*(T/M))*V_Put1(1);
V_Put2(N+1) = 0;      
    for i = 2:N
        V_Put2(i) = A(i)*V_Put1(i-1) + B(i)*V_Put1(i) + C(i)*V_Put1(i+1);
    end
V_Put1 = V_Put2;
end

V_Put = mean(V_Put1)
plot(S,V_Put1)
title('Payoff of Put Option by Finite Difference Scheme')
xlabel('Stock Price')
ylabel('Payoff of Put')
legend('Theoretical', 'FDS')