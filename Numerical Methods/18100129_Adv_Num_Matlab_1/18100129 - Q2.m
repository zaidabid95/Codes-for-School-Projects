% Question 2

syms f(x);
f(x) = 0.5 + 0.25.*(x.^2) - x.*sin(x) - 0.5.*cos(2.*x); %insert function here
df(x) = diff(f,x); %finds the differential of f(x)
x0 = 0.5*pi; %initial value can be changed for 5pi and 10pi
accuracy = 10^(-5); %tolerance level
error = abs(x0);
iteration = 0; %stores iteration value

a = vpa(subs(f,x,x0)); %calculates value of f(x0)
b = vpa(subs(df,x,x0)); %calculates value of f'(x0)

while error > accuracy && abs(b) > accuracy %checks if error and f'(x) is greater than accuracy. the loop keeps working until these conditions are violated
    a = vpa(subs(f,x,x0));
    b = vpa(subs(df,x,x0));
    x1 = double(x0 - (a/b)); %NEWTON METHOD
    error = abs(x1-x0);
    x0 = x1;
    iteration = iteration + 1;
    disp(iteration)
end

disp('Approximated Value');
disp(x0);