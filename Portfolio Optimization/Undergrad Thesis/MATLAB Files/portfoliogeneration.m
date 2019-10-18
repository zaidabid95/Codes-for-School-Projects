hold on
stockcov = cov(data);
%calculates a nxn covariance matrix of all the n stocks present in data
stockreturns = mean(data);
%calculates a 1xn matrix of the expected returns of each of the n stocks
stockcov = 4.*stockcov;
%annualizes the expected returns
stockreturns = 4.*stockreturns;
%annualizes the expected returns
iterations = 1000000;
%n = count(stockreturns);
W = zeros(iterations,89);

%start of a loop that will give 100,000 different portfolios
%records portfolio returns and portfolio variances
for i = 1:iterations
    weights = (rand([1 89]));
    for j = 1:89
        if (weights(1,j) > 0.1)
            weights(1,j) = 0;
        end
    end
    weights = weights./(sum(weights));
    weights = round(weights,3);
    %above set of codes generate a 1*n vector of weights summing to 1
    portret(1,i) = stockreturns*(weights.');
    %stores portfolio return in a vector 
    portvar(1,i) = (weights)*(stockcov)*(weights.');
    %stores portfolio variance in a vector
end
portsd = portvar.^0.5;
portsd = portsd./(sqrt(pi/2));
%calculated portfolio sd from portfolio variances
scatter(portsd,portret)
%plots sd against return

AssetScenarios = mvnrnd(stockreturns, stockcov, 100000);
p = PortfolioMAD;
p = setScenarios(p, AssetScenarios);
p = setDefaultConstraints(p);
plotFrontier(p);
%logic behind above code in minmeanvar.m
