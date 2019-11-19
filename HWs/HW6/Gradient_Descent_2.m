function N = Gradient_Descent_2(tol)
%initializes first guess for x, error, N, and gamma
x = [1,1.5];
err = 1;
N = 0;
gamma = 0.5;

%loop runs as long as our error is greater than our error tolerance
while err > tol
    %counter
    N = N + 1;
    %xtemp acts as xn, x acts as xn+1
    xtemp = x;
    x = xtemp - gamma*grad(x);
    %resets gamma with Barzilai-Borwein step size
    gamma = gam(x,xtemp);
    %computes l2 error
    err = sqrt(dot(x-xtemp,x-xtemp));
end
N
end

%computes gradient of f(x)
function val = grad(x)
val = [-cos(x(1)),sin(x(2))];
end

%computes Barzilai-Borwein step size
function val = gam(x,xtemp)
val = (abs(dot(x-xtemp,grad(x)-grad(xtemp)))/(dot(grad(x)-grad(xtemp),grad(x)-grad(xtemp))));
end

% For 1e-6 accuracy, it takes 6 iterations.
% For 1e-10 accuracy, it takes 7 iterations.