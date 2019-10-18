%Question 4

a = 2;
b = 4;
n = 100;
h = (b-a)/(2*n);
fa = (log(a))/(sqrt(a-1));
fb = (log(b))/(sqrt(b-1));

for i = 1:2*n
    x(i) = a + i*h;
end

for i = 1:(n-1)
f1(i) = (log(x(2*i)))/(sqrt(x(2*i)-1));
end

for j = 1:n
    f2(j) = (log(x(2*j-1)))/(sqrt(x(2*j-1)-1));
end

S = (h/3)*(fa+fb) + ((2/3)*h)*(sum(f1)) + ((4/3)*h)*(sum(f2));

disp('Final Answer')
disp('with n = ')
disp(n)
disp('Composite Simpson Rule Estimate = ')
disp(S)