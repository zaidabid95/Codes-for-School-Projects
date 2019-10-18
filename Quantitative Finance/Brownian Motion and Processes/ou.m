function[] = ou(alpha,SDr,r0,t,n)
dt = t/n;
r = zeros(1,n);
r(1) = r0;
for i = 1:n
    r(i+1) = r(i) + r(i)*(-alpha)*dt + SDr*sqrt(dt)*randn();
end
x = 0*ones(1,n);

figure
plot(r,'xc')
hold on
plot(x)

title('OU Process with alpha 2 and SD 0.03')
xlabel('n')
ylabel('r x')
legend('ou','mean')