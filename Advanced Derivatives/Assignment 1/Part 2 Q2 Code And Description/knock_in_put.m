function[V] = knock_in_put(r,SDx,x0,T,n,N,K,Barrier)
dt = T/n;
for i = 1:N
    x = zeros(1,n);
    x(1) = x0;
    for j = 1:n
        x(j+1) = x(j) + x(j)*r*dt + x(j)*SDx*sqrt(dt)*randn();
    end
    if min(x) <= Barrier
        payoff(i) = max(K - x(n), 0) * exp(-r*T);
    else
        payoff(i) = 0;
    end
    V = mean(payoff);
end