function value_of_call = Heston1993_MC(kappa_star,theta_star,v0,rho,sigma,T,r,K,S0,n,N)

    dt = T/n;               %time step
    payoff = zeros(N,1);	%vector to store payoffs for each simulation

    for j = 1:N
        S = zeros(n+1,1);
        v = zeros(n+1,1);
        S(1) = S0;
        v(1) = v0;
        for i=1:n
            %generate rho-correalted variables
            eta1 = randn();
            eta2 = eta1*rho + randn()*sqrt(1 - rho^2);
            %recursive process to get values of S(i+1) and v(i+1) from
            %S(i) and v(i)
            S(i+1) = S(i)*exp((r - 0.5*max(v(i),0))*dt ...
                     + sqrt(max(v(i),0))*sqrt(dt)*eta1);
            v(i+1) = v(i) + kappa_star*(theta_star - max(v(i),0))*dt ...
                     +sigma*sqrt(max(v(i),0))*sqrt(dt)*eta2;
        end
    payoff(j) = exp(-r*T)*max(S(n+1) - K,0); %discounted payoff
    end
    value_of_call = mean(payoff);            %average over all simulations
end