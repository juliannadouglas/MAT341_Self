function vary_Error_Tolerances_To_Compare()
%initializes error vector and vectors for the number of iterations for each
%algorithm
errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];
gSVec = [];
sPIVec = [];
nVec = [];

%computes N for each error tolerance for Golden Search
for i=1:length(errTolVec)
    gSVec(i) = golden_Search(errTolVec(i));
end

%computes N for each error tolerance for Successive Parabolic Interpolation
for i=1:length(errTolVec)
    sPIVec(i) = successive_Parabolic_Interpolation(errTolVec(i));
end

%computes N for each error tolerance for Newton's 1D method
for i=1:length(errTolVec)
    nVec(i) = Newtons_1D_Opt(errTolVec(i));
end

%creates semilog plot
figure(1)
semilogx(errTolVec,gSVec,'c',errTolVec,sPIVec,'r',errTolVec,nVec,'k','LineWidth',5)
xlabel('Error Tolerance');
ylabel('Number of Iterations');
legend('Golden Search','Succ. Para. Interp.','Newton Method');

%creates loglog plot
figure(2)
loglog(errTolVec,gSVec,'c',errTolVec,sPIVec,'r',errTolVec,nVec,'k','LineWidth',5)
xlabel('Error Tolerance');
ylabel('Number of Iterations');
legend('Golden Search','Succ. Para. Interp.','Newton Method');

% For less accuarate tolerances, Newton's Method converges the fastest.
% When we increase the accuracy threshold, Newton's Method still converges
% the fastest.
% To change the convergence rates, we could change our initial guesses.