function N = golden_Search(tol)
%a and b are the endpoints of our interval
a = 0;
b = 2;
%initializes error and counter
err = 1;
counter = 0;

while err > tol    
    %initializes search step and x values
    T = (sqrt(5) - 1)/2;
    x1 = a + (1-T)*(b-a);
    x2 = a + T*(b-a);
    %resets x1 if f(x1) is bigger
    if f(x1) > f(x2)
        a = x1;
    %resets x2 if f(x2) is bigger
    elseif f(x2) >= f(x1)
        b = x2;
    end
    %error is set to the distance between a and b
    err = b - a;
    %keeps track of how many times the while loop runs
    counter = counter + 1;
end
%prints out the min found from a and b
min = (a + b)/2
N = counter
end

%function whose min we are trying to find
function val = f(x)
val = 0.5 - x*exp(-x^2);
end

%It takes 40 iterations to achieve 1e-8 accuracy.