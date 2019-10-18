function[] = cirprocess(alpha,beta,SDr,r0,t,n)
dt = t/n;
r = zeros(1,n);
r(1) = r0;
for i = 1:n
    r(i+1) = r(i) + (beta - r(i))*(alpha)*dt + SDr*sqrt(r(i))*sqrt(dt)*randn();
end
x = beta*ones(1,n);
figure
plot(r,'xc')
hold on
plot(x)

title('CIR with alpha 2 and SD 0.1 and beta 0.55')
xlabel('n')
ylabel('r x')
legend('cir','mean')