%Question Number 1

A = []; %input A matrix
b = []'; %input b vector here
n = length(b); 

if all((2*abs(diag(A))) >= sum(abs(A),2))
    disp('A is diagonally dominant')
else
    disp('A is not diagonally dominant')
end

D = diag(diag(A));
L = -tril(A,-1);
U = -triu(A,1);
tol = 10^-5; %input tolerance here

%Jacobi Method

x0 = zeros(n,1); %input initial guess here
x1 = x0;
x2 = ones(n,1);
iter_j = 0;

while abs(max(x2-x1)) > tol
    x2 = inv(D)*(L+U)*x0 + inv(D)*b;
    x1 = x0;
    x0 = x2;
    iter_j = iter_j + 1;
end

disp('Number of Iterations')
disp(iter_j)
disp('Answer by Jacobi')
disp(x2')

%Gauss Siedel Method

x0 = zeros(n,1); %input initial guess here
x1 = x0;
x2 = ones(n,1);
iter_g = 0;

while abs(max(x2-x1)) > tol
    x2 = inv(D-L)*U*x0 + inv(D-L)*b;
    x1 = x0;
    x0 = x2;
    iter_g = iter_g + 1;
end

disp('Number of Iterations')
disp(iter_g)
disp('Answer by Gauss Siedel')
disp(x2')