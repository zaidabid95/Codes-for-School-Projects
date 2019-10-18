% Question 3

syms f(x);
f(x) = 230.*x.^(4) + 18.*x.^(3) + 9.*x.^(2) - 221.*x - 9; %insert function here
t0 = 0; %initial values
t1 = 1; %initial values
accuracy = 10^(-5); %tolerance levels
error = abs(t1-t0);
iteration = 0; %stores iteration value

a = vpa(subs(f,x,t0)); %calculates value of f(t0)
b = vpa(subs(f,x,t1)); %calculates value of f(t1)

while error > accuracy && abs(b-a) > accuracy %checks if error and denominator (b-a) is greater than accuracy. the loop keeps working until these conditions are violated
    a = vpa(subs(f,x,t0));
    b = vpa(subs(f,x,t1));
    t2 = double(t1 - (b*(t1-t0))/(b-a)); %SECANT METHOD (new value stored in t2)
    error = abs(t2-t1);
    t0=t1; %value of t0 replaced by t1
    t1=t2; %value of t1 replaced by t2
    iteration = iteration + 1;
    disp(iteration)
end

disp('Approximated Value');
disp(t1);