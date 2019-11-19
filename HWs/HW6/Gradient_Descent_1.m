function N = Gradient_Descent_1(tol,gamma)
%initializes first guess, err, and N at 0
x = [1,1.5];
err = 1;
N = 0;

%loop runs as long as our error is bigger than our error tolerance
while err > tol
    %counter
    N = N + 1;
    %xtemp functions as xn and x becomes xn+1
    xtemp = x;
    x = xtemp - gamma*grad(x);
    %computes l2 error
    err = sqrt(dot(x-xtemp,x-xtemp));
end
N
f(x)
end

%computes f(x)
function val = f(x)
val = -(sin(x(1)) + cos(x(2)));
end

%computes gradient of f(x)
function val = grad(x)
val = [-cos(x(1)),sin(x(2))];
end

% It took 35 iterations for tol = 1e-10 and gamma = 0.5.
% It took 12 iterations for tol = 1e-10 and gamma = 0.9.
% It took 34 iterations for tol = 1e-10 and gamma = 1.5.