clear all

load('interpolated_data.mat');
%loads interpolated rates as a matrix

final = zeros(679,60);
for z = 1:679
    %creates an upper triangular bond cash flow matrix
    for i = 1:60
        for j = 1:60
            if j < i
                A(i,j) = sampledata(z,i)/2;
            elseif j > i
                A(i,j) = 0;
            else
                A(i,j) = sampledata(z,i)/2 + 1;
            end
        end
    end
    %assuming par value bonds so prices = 1
    p = ones(60,1);
    %calculats the zero coupon bond prices
    r = A^(-1) * p;
    t = (0.5:0.5:30)';
    %calculates rates from bond prices
    rates = log(r)./-t;
    final(z,:) = rates;
end