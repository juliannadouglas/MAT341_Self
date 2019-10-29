function vary_Error_Tolerances_To_Compare()
%initializes error vector and vectors for the number of iterations for each
%algorithm
errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];
gSVec = [];
sPIVec = [];

%computes N for each error tolerance for Golden Search
for i=1:length(errTolVec)
    gSVec(i) = golden_Search(errTolVec(i));
end

%computes N for each error tolerance for Successive Parabolic Interpolation
for i=1:length(errTolVec)
    sPIVec(i) = successive_Parabolic_Interpolation(errTolVec(i));
end

%creates semilog plot
figure(1)
semilogx(errTolVec,gSVec,'c',errTolVec,sPIVec,'r','LineWidth',5)
xlabel('Error Tolerance');
ylabel('Number of Iterations');
legend('Golden Search','Succ. Para. Interp.');

%creates loglog plot
figure(2)
loglog(errTolVec,gSVec,'c',errTolVec,sPIVec,'r','LineWidth',5)
xlabel('Error Tolerance');
ylabel('Number of Iterations');
legend('Golden Search','Succ. Para. Interp.');

%For less accurate tolerances, it appears that Successive Parabolic
%Interpolation converges faster. However, when the accuracy threshold is
%increased, the Golden Search method converges faster. The Golden Search
%coonvergence speed is pretty similar throughout, but the Successive
%Parabolic Interpolation convergence speed changes rapidly once the error
%tolerance gets below about 1e-7. The convergence speed most likely changes
%due to the fact that the coefficients are getting smaller and smaller and
%getting close to being parallel, making the matrix almost singular, so the
%matrix takes longer and longer to solve.