function fit_Sine_Series()
M = 40;
%creates data
N = 500;
xData = linspace(-pi,pi,N);
yData = ((0.25*xData.^2).*cos(xData).^4.*sin(xData).^7)';

%fills vector
for i=1:N
    %puts data into x and y vectors
    x = xData(i);
    y = yData(i);
    
    %matrix
    for j=1:M
        A(i,j) = [sin(j*x)];
    end
    B(i,:) = y;
end

%computes inverse of matrix and beta
inverse = (inv(A'*A))*A';
beta = inverse*B;

for i=1:N
    %sets matrix equal to new beta values
    x = xData(i);
    %sets col to 0
    f(i,1) = 0;
    %initializes j
    j = 1;
    while j<=M
        f(i,1) = f(i,1) + beta(j)*sin(j*x);
        j = j + 1;
    end
end

%plots data
figure;
plot(xData,yData,'o','linewidth',6);
hold on;
plot(xData,f,'R','linewidth',4);
legend('Data','Best Sine Series Fit');

%calculates residual
Res = B - A*beta;
l2 = sqrt(Res'*Res)
beta

% When M = 5, the residual is 0.0813. When M = 10, the residual is 0.0096.
% When M = 20, the residual is 0.000002. When M = 40, the residual is
% 0.000000004. As M gets larger, the residual gets stronger.
% This series is called Fourier sine series.