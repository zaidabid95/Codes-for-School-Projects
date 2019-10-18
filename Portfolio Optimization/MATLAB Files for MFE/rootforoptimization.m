X = zeros(81,1294);
R = zeros(81,1);
D = zeros(81,1);

for i = 1:1:81
    rate = 0.1 + 0.005*(i-1);
    [opweights ret sd] = optimumportfolio(rate);
    R(i,1) = ret;
    D(i,1) = sd;
    for j = 1:1294
        X(i,j) = opweights(j);
    end
end