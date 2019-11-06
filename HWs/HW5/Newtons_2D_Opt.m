function N = Newtons_2D_Opt(tol)
%initial values
x = [-4.5;4.5];
err = 1;
N = 0;

%runs as long as we are above our error tolerance
while err > tol
    %keeps xn
    xtemp = x;
    %updates x to xn+1
    x = x - inv(H(x))*gradf(x);
    %computes error by l2norm method
    err = sqrt(dot(x-xtemp,x-xtemp));
    N = N + 1;
end
f(x)
end

%function
function val = f(x)
val = -(sin(x(1)) + cos(x(2)));
end

%Hessian
function val = H(x)
val = [sin(x(1)) 0; 0 cos(x(2))];
end

%gradient
function val = gradf(x)
val = [-cos(x(1)); sin(x(2))];
end

% With the original initial guess, it takes 5 iterations to converge to a
% minima of -2.
% When the initial guess is changed to (-4.5,4.5) it takes 4 iterations to
% converge to the same minima of -2.