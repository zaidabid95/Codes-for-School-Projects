function Price=NandiGARCH(S0,K,sigma,T,r,lambda_star,alpha1,beta1,gamma1,lambda,omega)

%The function calulates the price of a call using the changing
%volatility model used by Henston and NANDI in their 2000 paper

Price = S0*0.5+((1/pi)*integral(@Integrand1,0,Inf))...
        -K*exp(-r*T)*(0.5+(1/pi)*integral(@Integrand2,0,Inf));

    function z1=Integrand1(phi)
    %function that returns the function to be integrated
        z1 = real((K.^(-i*phi).*momgfun(i*phi+1))./(i*phi));
    end

    function z2=Integrand2(phi)
    %function that returns the function to be integrated
        z2 = real((K.^(-i*phi).*momgfun(i*phi))./(i*phi));
    end

    function f1=momgfun(phi)
    % function that returns the value for the moment generating function
    
        gamma_star = gamma1 + lambda + 0.5;                
        phi = phi';

        A(:,T) = phi*r; %to get vector of zeros since r = 0 at time = T
        B(:,T) = phi*r; %to get vector of zeros since r = 0 at time = T

        for i=1:T-1
            A(:,T-i) = A(:,T-i+1)+phi.*r+B(:,T-i+1).*omega...
                       -0.5*log(1-2*alpha1.*B(:,T-i+1));
            B(:,T-i) = phi.*(lambda_star+gamma_star)-.5*gamma_star^2+beta1.*B(:,T-i+1)...
                       +0.5.*(phi-gamma_star).^2./(1-2.*alpha1.*B(:,T-i+1));
        end

        A_t0 = A(:,1)+phi.*r+B(:,1).*omega...
              -0.5*log(1-2.*alpha1.*B(:,1));                    
        B_t0 = phi.*(lambda_star+gamma_star)-.5*gamma_star^2+beta1.*B(:,1)...
              +0.5*(phi-gamma_star).^2./(1-2.*alpha1.*B(:,1)); 

        f1 = S0.^phi.*exp(A_t0+B_t0.*sigma);
        f1 = f1';
    end

end    