function value_of_call = GARCH2000_MC(T,r,K,S0,h0,n,N,lambda,lambda_star,alpha1,beta1,gamma1,omega)

    gamma1_star = gamma1 + lambda + 0.5;
    dt = T/n;               %time step
    payoff = zeros(N,1);    %vector to store payoffs for each simulation

    for j = 1:N
        S = zeros(n+1,1);
        h = zeros(n+1,1);
        z_star = zeros(n+1,1);
        S(1) = S0;
        h(1) = h0;
        z_star(1) = randn()*sqrt(dt);
        for i=1:n
            %recursive process to get values of S(i+1) and h(i+1) from
            %S(i) and h(i)
            h(i+1)      = omega + beta1*h(i) + alpha1*((z_star(i) ...
                          - gamma1_star*sqrt(max(h(i),0))))^(2);
            %generate Weiner Process
            z_star(i+1) = randn()*sqrt(dt) + (lambda + 0.5)*sqrt(h(i+1));
            S(i+1)      = S(i)*exp(((r + lambda_star*h(i+1))*dt  ...
                          + sqrt(max(h(i+1),0))*z_star(i+1)));
        end
    payoff(j) = exp(-r*T)*max(S(n+1) - K,0);  %discounted payoff
    end
    value_of_call = mean(payoff);             %average over all simulations
end