% Question 1

syms f(x);
f(x) = (x-2).^2 - log(x); %insert function here
df(x) = diff(f,x); %finds the differential of f(x)
x0 = 4; %initial value
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
disp(x0); %displays value