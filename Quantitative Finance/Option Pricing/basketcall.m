function [V] = basketcall(r, SDx, x0, t, n, N, K, w)
dt = t/n;
for i = 1:N
    x = zeros(5,n);
    for k = 1:5
    x(k,1) = x0(k);
    for j = 1:n
    x(k,j+1) = x(k,j) + x(k,j)*r*dt + x(k,j)*SDx(k)*sqrt(dt)*randn();
    end
    end
    x_n = [x(1,n) x(2,n) x(3,n) x(4,n) x(5,n)];
    payoff(i) = max((x_n*(w.')) - (K*(w.')), 0) * exp(-r*t);
end

V = sum(payoff)/N;

