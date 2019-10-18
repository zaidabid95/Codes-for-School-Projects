openfig('figures.fig');
hold on
%alpha and beta vary with the risk profile
alpha = 0.5;
beta = 0.5;
risk = 0.1:0.0005:0.2;

for i = 1:0.2:2
ret = ((i)./(risk.^(-beta))).^(1/alpha);
plot(risk,ret)
end

%manual inputs allow to make ICs for different investor behaviours