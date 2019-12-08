function perform_Nonlinear_Least_Squares()
tol = 1e-5;
N = 2500;
err = 1;
b = [1; 0.5; 0.3];
dyVec = [];
J = [];
data = give_NonLinear_Least_Squares_Data(N);

while err > tol
    for i=1:N
        x = data(i,1);
        expy = exp(-(x-b(2))^2/(2*b(3)^2));
        dyVec(i,1) = data(i,2) - expy*b(1);
        J(i,1) = expy;
        J(i,2) = b(1)*((x-b(2))/b(3)^2)*expy;
        J(i,3) = b(1)*((x-b(2))^2/b(3)^3)*expy;
    end
    dbVec = inv(J'*J)*J'*dyVec;
    btemp = b;
    b = b + dbVec;
    err = dot(b-btemp,b-btemp);
end
b

fVec = [];
for i=1:N
   fVec(i) = b(1)*exp(-(data(i,1)-b(2))^2/(2*b(3)^2));
end

plot(data(:,1),fVec,'r','MarkerSize',20,'LineWidth',4);
legend('Data','Model Fit');
end