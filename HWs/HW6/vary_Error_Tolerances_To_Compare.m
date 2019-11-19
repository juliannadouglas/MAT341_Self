function vary_Error_Tolerances_To_Compare()
%initializes error vector and vectors for the number of iterations for each
%algorithm
errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11];
g1Vec = [];
g2Vec = [];

%computes N for each error tolerance for Gradient Descent 1
for i=1:length(errTolVec)
    g1Vec(i) = Gradient_Descent_1(errTolVec(i),0.5);
end

%computes N for each error tolerance for Gradient Descent 2
for i=1:length(errTolVec)
    g2Vec(i) = Gradient_Descent_2(errTolVec(i));
end

%creates semilog plot
figure(1)
semilogx(errTolVec,g1Vec,'c',errTolVec,g2Vec,'r','LineWidth',5)
xlabel('Error Tolerance');
ylabel('Number of Iterations');
legend('Fixed Step','Barzilai-Borwein');

%creates loglog plot
figure(2)
loglog(errTolVec,g1Vec,'c',errTolVec,g2Vec,'r','LineWidth',5)
xlabel('Error Tolerance');
ylabel('Number of Iterations');
legend('Fixed Step','Barzilai-Borwein');

% The fixed step size appears to converge faster to the minima.
% If in the fixed step size gamma is changed to 0.5, then the
% Barzilai-Borwein algorithm converges faster.
% An advantage of using the Barzilai-Borwein algorithm is that we don't
% need to know that an adequate step size would be.
% If I were to modify my code to minimize a different function, I would
% choose the Barzilai-Borwein method because I wouldn't need to figure out
% which fixed step size to use.