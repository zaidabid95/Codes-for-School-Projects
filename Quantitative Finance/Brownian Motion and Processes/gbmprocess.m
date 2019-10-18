function[] = gbmprocess(Ex,SDx,x0,t,n)
dt = t/n;
x = zeros(1,n);
x(1) = x0;
for i = 1:n
    x(i+1) = x(i) + x(i)*Ex*dt + x(i)*SDx*sqrt(dt)*randn();
end

figure

plot(x,'xc')
title('Geometric Brownian Motion with Mean 0.03, SD 0.06')
xlabel('n')
ylabel('x')
legend('gbm')