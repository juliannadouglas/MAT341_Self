function N = Nelder_Mead(tol)
err = 1;
N = 0;
%x1 = 6*rand() - 1;
%y1 = 6*rand() - 1;
%x2 = 6*rand() - 1;
%y2 = 6*rand() - 1;
%x3 = 6*rand() - 1;
%y3 = 6*rand() - 1;
x1 = 0.35;
y1 = 2.8;
x2 = 4;
y2 = 4;
x3 = 4.5;
y3 = 4.5;

%creates vector of x and y values and their function values
xyVec = [x1 y1; x2 y2; x3 y3];
fVec = [f(x1,y1) f(x2,y2) f(x3,y3)];

while err > tol
    N = N + 1;
    %orders the elements in the vector from least to greatest
    [fSorted, indsVec] = sort(fVec);
    %indicates which element is the smallest, middle, and greatest
    xLeast = xyVec(indsVec(1),:);
    xMid = xyVec(indsVec(2),:);
    xGreat = xyVec(indsVec(3),:);
    
    %computes midpoint vector
    rM = 0.5*(xLeast + xMid);
    %computes reach vector2qaz
    rR = rM + (rM - xGreat);
    
    if f(rR(1),rR(2)) < f(xGreat(1),xGreat(2))
        xGreat = rR;
    elseif f(rR(1),rR(2)) >= f(xGreat(1),xGreat(2))
        xC = 0.5*(rM + xGreat);
        
        if f(xC(1),xC(2)) < f(xGreat(1),xGreat(2))
            xGreat = xC;
        else
            xMid = 0.5*(xLeast + xMid);
            xGreat = 0.5*(xLeast + xGreat);
        end
    end
    
    xyVec = [xLeast(1) xLeast(2); xMid(1) xMid(2); xGreat(1) xGreat(2)];
    fVec = [f(xLeast(1),xLeast(2)) f(xMid(1),xMid(2)) f(xGreat(1),xGreat(2))];
    err = abs(f(xLeast(1),xLeast(2)) - f(xGreat(1),xGreat(2)))
end
xLeast;
f(xLeast(1),xLeast(2))
N
end

function val = f(x,y)
val = -(sin(x) + cos(y));
end

% To achieve 1e-8 accuracy, it takes 29 iterations.
% With the given points, it appears to converge to -2.0000. The true
% minimum is -2, so this appears quite accurate, but since it is giving
% -2.0000 instead of -2, it is probably not giving exactly -2, but has some
% extremely small decimal.
% With the new x2 and y2, it now takes 58 iterations to achieve 1e-8
% accuracy. It still converges to -2.0000. This took twice as many
% iterations as part (a) although it is closer to the minima. This could be
% because the reach vector and midpoint vector are going to be shorter, so
% it will take more iterations to get as close to the minima as we need to.
% With the next set of new x and y values, it is still converging to
% -2.0000.