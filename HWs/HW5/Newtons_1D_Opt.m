function N = Newtons_1D_Opt(tol)
%optimization of a single variable

%initial values
x = 0.25;
err = 1;
N = 0;

%runs as long as we are above our error tolerance
while err > tol
    %saves xn
    xtemp = x;
    %updates x to xn+1
    x = x - fprime(x)/f2prime(x);
    err = abs(xtemp - x);
    N = N + 1;
end
x
end

%function we are trying to optimize
function val = f(x)
val = 0.5 - x*exp(-x^2);
end

%derivative of the function
function val = fprime(x)
val = -exp(-x^2) + 2*x^2*exp(-x^2);
end

%second derivative of the function
function val = f2prime(x)
val = 2*x*exp(-x^2) + 4*x*exp(-x^2) - 4*x^3*exp(-x^2);
end

% With the given initial guess, it takes 6 iterations for 1e-8 accuracy.
% When the initial guess was changed to 1.5, it now took 736 iterations.