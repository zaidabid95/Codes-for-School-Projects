function [weightsforrate, optimumret, minimummad] = optimumportfolio(rate)

load('datamatlab.mat');
stockcov = cov(data);
%calculates a nxn covariance matrix of all the n stocks present in data
stockreturns = mean(data);
%calculates a 1xn matrix of the expected returns of each of the n stocks
stockcov = 4.*stockcov;
%annualizes the expected returns
stockreturns = 4.*stockreturns;
%annualizes the expected returns

%optimization function
nAssets = numel(stockreturns);
Aeq = ones(1,nAssets);
beq = 1;
Aineq= -stockreturns;
bineq = -rate;
lb = zeros(nAssets,1);
ub = ones(nAssets,1);
c = zeros(nAssets,1);

options = optimoptions('quadprog','Algorithm','interior-point-convex');

weightsforrate = quadprog(stockcov,c,Aineq,bineq,Aeq,beq,lb,ub,[],options);

%calculation of return to check and the minimum variance
optimumret = stockreturns*weightsforrate;
minimumvar = (weightsforrate.')*stockcov*weightsforrate;
minimumsd = minimumvar.^0.5;
minimummad = minimumsd./(sqrt(pi/2));


end

