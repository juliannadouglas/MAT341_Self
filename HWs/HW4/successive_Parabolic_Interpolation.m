function N = successive_Parabolic_Interpolation(tol)
%initializes x values, error, and counter
x1 = 0;
x2 = 0.6;
x3 = 1.2;
err = 1;
counter = 0;

while err > tol
    %creates a vector of the polynomial
    A = [x1^2 x1 1; x2^2 x2 1; x3^2 x3 1];
    %creates a vector of the function values
    b = [f(x1); f(x2); f(x3)];
    %solves for the coefficients
    coeffs = inv(A)*b;
    %finds the vertex of the parabola, which is the min
    xMin = (-coeffs(2))/(2*coeffs(1));
    %resets x values
    x3 = x2;
    x2 = x1;
    x1 = xMin;
    %computes the error, adds one to the counter each iteration
    err = abs(x3 - x1);
    counter = counter + 1;
end
%prints out the min and the number of iterations
xMin
N = counter
end

%function whose min we are trying to find
function val = f(x)
val = 0.5 - x*exp(-x^2);
end

%It takes 32 iterations
%When I changed x3 to 2, the number of iterations changed to 39. While
%running, I get a warning that says that the matrix is close to singular or
%badly scaled, and that the results may be inaccurate. This is due to the
%fact that as the error threshold changes, the coefficients are getting
%smaller and smaller and are almost becoming parallel.