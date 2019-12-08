function fit_Polynomial_Series()
%creates data
N = 250;
xData = linspace(-2*pi,2*pi,N);
yData = cos(xData)';

%fills vector
for i=1:N
    %puts data into x and y vectors
    x = xData(i);
    y = yData(i);
    
    %matrix
    A(i,:) = [1 x x^2 x^3 x^4 x^5 x^6 x^7 x^8 x^9 x^10 x^11 x^12];
    B(i,:) = y; 
end

%computes inverse of matrix and beta
inverse = (inv(A'*A))*A';
beta = inverse*B;

for i=1:N
    %sets matrix equal to new beta values
    x = xData(i);
    f(i,1) = beta(1) + beta(2)*x + beta(3)*x^2 + beta(4)*x^3 + beta(5)*x^4 + beta(6)*x^5 + beta(7)*x^6 + beta(8)*x^7 + beta(9)*x^8 + beta(10)*x^9 + beta(11)*x^10 + beta(12)*x^11 + beta(13)*x^13;
end

%plots data
figure;
plot(xData,yData,'o','linewidth',6);
hold on;
plot(xData,f,'R','linewidth',4);
legend('Data','Best Poly Fit');

%calculates residual
Res = B - A*beta;
l2 = sqrt(Res'*Res)
beta

% When N = 10, the residual is 2.7677. When N = 50, the residual is
% 0.000515. When N = 250, the residual is 0.0011. It seems as though a
% smaller N leads to a larger residual.
% Previously, I have seen cos(x) written as a polynomial in a Taylor Series
% expansion. The coefficients were (-1)^n * 1/(2n)!
% When N = 250, every other coefficient is 0, and the remaining
% coefficients alternate between positive and negative. They appear to be
% following the same pattern as the Taylor Series expansion.