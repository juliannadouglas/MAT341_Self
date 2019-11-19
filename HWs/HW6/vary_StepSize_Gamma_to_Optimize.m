function vary_StepSize_Gamma_to_Optimize()
% initializes vector of gamma values and N vector
gammaVec = [0.05:0.05:1.5];
NVec = [];

% stores the number of iterations for each step size
for i=1:length(gammaVec)
    NVec(i) = Gradient_Descent_1(1e-10,gammaVec(i));
end

% plots data with a logarithmic axis for x
semilogx(gammaVec,NVec,'c','LineWidth',5);
xlabel('Step Size');
ylabel('Number of Iterations');
legend('Fixed Step');

% The best step size appears to be gamma = 1.