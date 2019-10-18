%Question Number 3

A = [4 1 -1 1; 1 4 -1 -1; -1 -1 5 1; 1 -1 1 3]; %input A matrix
b = [-2 -1 0 1]'; %input b vector here
n = length(b); 

D = diag(diag(A));
C = D^(1/2); %pre-condition
A = inv(C)*A*inv(C');
b = inv(C)*b;
tol = 10^-5; %input tolerance here

x0 = zeros(n,1); %input initial guess here
r0 = b - A*(C'*x0);
v1 = r0;
x1 = x0;
x2 = ones(n,1);
iter = 0;

while abs(max(x2-x1)) > tol
    t1 = (r0'*r0)/(v1'*(A*v1));
    x2 = inv(C')*((C'*x0) + t1*v1);
    r1 = r0 - t1*A*v1;
    s1 = (r1'*r1)/(r0'*r0);
    v2 = r1 + s1*v1;
    r0 = r1;
    x1 = x0;
    x0 = x2;
    v1 = v2;
    iter = iter+1;
end

disp('Number of Iterations')
disp(iter)
disp('Answer by CGM')
disp(x2')