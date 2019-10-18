function[V1, V2, V3, V4, V5, V6, V7, V8] = option(r,SDx,x0,t,n,N,K)
dt = t/n;
for i = 1:N
    x = zeros(1,n);
    x(1) = x0;
    for j = 1:n
    x(j+1) = x(j) + x(j)*r*dt + x(j)*SDx*sqrt(dt)*randn();
    end
    payoff1(i) = max(x(n) - K, 0) * exp(-r*t);
    payoff2(i) = max(K - x(n), 0) * exp(-r*t);
    if (x(n) - K) >= 0 
        payoff3(i) = 1;
    else
        payoff3(i) = 0;
    end
    if (K - x(n)) >= 0
        payoff4(i) = 1;
    else
        payoff4(i) = 0;
    end
    payoff5(i) = max(max(x) - K, 0) * exp(-r*t);
    payoff6(i) = max(K - min(x), 0) * exp(-r*t);
    payoff7(i) = max(x(n) - min(x), 0) * exp(-r*t);
    payoff8(i) = max(max(x) - x(n), 0) * exp(-r*t);
end

V1 = sum(payoff1)/N;
V2 = sum(payoff2)/N;
V3 = sum(payoff3)/N;
V4 = sum(payoff4)/N;
V5 = sum(payoff5)/N;
V6 = sum(payoff6)/N;
V7 = sum(payoff7)/N;
V8 = sum(payoff8)/N;