%Question 4

syms f(x,y,z) g(x,y,z) h(x,y,z)
f(x,y,z) = x^(2) - x + y^(2) + z^(2) - 5; %enter first function
dfx(x,y,z) = diff(f,x); %derivative wrt x
dfy(x,y,z) = diff(f,y); %derivative wrt y
dfz(x,y,z) = diff(f,z); %derivative wrt z
g(x,y,z) = x^(2) + y^(2) - y + z^(2) - 4; %enter second function
dgx(x,y,z) = diff(g,x); %derivative wrt x
dgy(x,y,z) = diff(g,y); %derivative wrt y
dgz(x,y,z) = diff(g,z); %derivative wrt z
h(x,y,z) = x^(2) - x + 2*(y^(2)) + y*z - 10; %enter third function
dhx(x,y,z) = diff(h,x); %derivative wrt x
dhy(x,y,z) = diff(h,y); %derivative wrt y
dhz(x,y,z) = diff(h,z); %derivative wrt x
%add more such lines for more equations and unknowns
x0 = 1; %initial values
y0 = 1; %initial values
z0 = 1; %initial values
accuracy = 10^(-5); %tolerance level
iteration = 0; %stores iteration value

a = double([vpa(subs(f,[x y z],[x0 y0 z0])); vpa(subs(g,[x y z],[x0 y0 z0])); vpa(subs(h,[x y z],[x0 y0 z0]))]); %vector containing value of f g and h at x0,y0,z0
b = double([vpa(subs(dfx,[x y z],[x0 y0 z0])) vpa(subs(dfy,[x y z],[x0 y0 z0])) vpa(subs(dfz,[x y z],[x0 y0 z0])); vpa(subs(dgx,[x y z],[x0 y0 z0])) vpa(subs(dgy,[x y z],[x0 y0 z0])) vpa(subs(dgz,[x y z],[x0 y0 z0])); vpa(subs(dhx,[x y z],[x0 y0 z0])) vpa(subs(dhy,[x y z],[x0 y0 z0])) vpa(subs(dhz,[x y z],[x0 y0 z0]))]); %differential matrix containing value of df dg and dh at x0,y0,z0 wrt x y and z respectively
k = b\a;
while abs(k(1)) > accuracy || abs(k(2)) > accuracy || abs(k(3)) > accuracy %check if the added value is greater than tolerance level
    a = double([vpa(subs(f,[x y z],[x0 y0 z0])); vpa(subs(g,[x y z],[x0 y0 z0])); vpa(subs(h,[x y z],[x0 y0 z0]))]);
    b = double([vpa(subs(dfx,[x y z],[x0 y0 z0])) vpa(subs(dfy,[x y z],[x0 y0 z0])) vpa(subs(dfz,[x y z],[x0 y0 z0])); vpa(subs(dgx,[x y z],[x0 y0 z0])) vpa(subs(dgy,[x y z],[x0 y0 z0])) vpa(subs(dgz,[x y z],[x0 y0 z0])); vpa(subs(dhx,[x y z],[x0 y0 z0])) vpa(subs(dhy,[x y z],[x0 y0 z0])) vpa(subs(dhz,[x y z],[x0 y0 z0]))]);
    k = b\a;
    x1 = [x0; y0; z0] - k;
    x0 = x1(1); y0 = x1(2); z0 = x1(3);
    iteration = iteration + 1;
    disp(iteration)
end

disp('Approximated Value');
disp([x0; y0; z0]);