function Call_Price = StochVol(S0,K,sigma,T,r,v0,rho,kappa_star,theta_star)

%The function calulates the price of a call using the stochastic
%volatility model used by Henston in his 1993 paper

Call_Price = S0*(0.5+(1/pi)*integral(@function_in_integral_1,eps,100))-K*exp(-r*T)*(0.5+(1/pi)*integral(@function_in_integral_2,eps,100));

    function z1 = function_in_integral_1(phi)
        z1 = real((K.^(-i*phi)).*f1(i*phi)./(i*phi));
    end

    function z2 = function_in_integral_2(phi)
        z2 = real((K.^(-i*phi)).*f2(i*phi)./(i*phi));
    end


    function f1 = f1(phi)

        a     = kappa_star*theta_star; %since it is equal to kappa*theta
        b1    = kappa_star - rho*sigma; %since kappa + lambda = kappa_star 
        b2    = kappa_star; %since kappa + lambda = kappa_star 
        u1    = 0.5;
        u2    = -0.5;
        x     = log(S0);

        phi = phi';

        d1 = sqrt(((rho.*sigma.*phi - b1).^2) - (sigma.^2)*(2.*u1.*phi + (phi).^2));
        g1 = (b1 - rho.*sigma.*phi + d1)./(b1 - rho.*sigma.*phi - d1);

        C1 = r.*phi.*T + (a./sigma.^(2)).*((b1 - rho.*sigma.*phi + d1).*T - 2.*log((1 - g1.*exp(d1.*T))./(1 - g1)));
        D1 = ((b1 - rho.*sigma.*phi + d1)/(sigma.^(2))).*((1 - exp(d1.*T))./(1 - g1.*exp(d1.*T)));

        f1 = exp(C1 + D1.*v0 + phi.*x);
        f1 = f1';
    end

    function f2 = f2(phi)

        a     = kappa_star*theta_star; %since it is equal to kappa*theta
        b1    = kappa_star - rho*sigma; %since kappa + lambda = kappa_star 
        b2    = kappa_star; %since kappa + lambda = kappa_star 
        u1    = 0.5;
        u2    = -0.5;
        x     = log(S0);

        phi = phi';

        d2 = sqrt(((rho.*sigma.*phi - b2).^2) - (sigma.^2)*(2.*u2.*phi + (phi).^2));
        g2 = (b2 - rho.*sigma.*phi + d2)./(b2 - rho.*sigma.*phi - d2);

        C2 = r.*phi.*T + (a./sigma.^(2)).*((b2 - rho.*sigma.*phi + d2).*T - 2.*log((1 - g2.*exp(d2.*T))./(1 - g2)));
        D2 = ((b2 - rho.*sigma.*phi + d2)/(sigma.^(2))).*((1 - exp(d2.*T))./(1 - g2.*exp(d2.*T)));

        f2 = exp(C2 + D2.*v0 + phi.*x);
        f2 = f2';
    end

end