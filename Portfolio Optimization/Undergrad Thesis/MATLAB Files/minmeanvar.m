load('datamatlab.mat')
stockcov = cov(data);
%calculates a nxn covariance matrix of all the n stocks present in data
stockreturns = mean(data);
%calculates a 1xn matrix of the expected returns of each of the n stocks
stockcov = 4.*stockcov;
%annualizes the expected returns
stockreturns = 4.*stockreturns;
%annualizes the expected returns

for i = 1:38
nAssets = numel(stockreturns);
rate = 0.05+(i/100);
Aeq = ones(1,nAssets);
beq = 1;
Aineq= -stockreturns;
bineq = -rate;
lb = zeros(nAssets,1);
ub = ones(nAssets,1);
c = zeros(nAssets,1);

options = optimoptions('quadprog','Algorithm','interior-point-convex');

tic;
weightsforrate = quadprog(stockcov,c,Aineq,bineq,Aeq,beq,lb,ub,[],options);
toc;

optimumret(i) = stockreturns*weightsforrate;
minimumvar = (weightsforrate.')*stockcov*weightsforrate;
minimumsd = minimumvar.^0.5;
minimummad(i) = minimumsd./(sqrt(pi/2));
end

plot(minimummad,optimumret);