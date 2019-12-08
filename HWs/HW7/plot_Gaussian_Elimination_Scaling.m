function plot_Gaussian_Elimination_Scaling()
NVec = 2:1:100;
countVec = [];

for i=1:length(NVec)
    countVec(i) = go_Go_Gaussian_Elimination(NVec(i));
end

figure(1);
loglog(NVec,countVec,'b','linewidth',5);
xlabel('Size of NxN matrix');
ylabel('Number of operations needed');

figure(2);
plot(NVec,countVec,'b','linewidth',5);
xlabel('Size of NxN matrix');
ylabel('Number of operations needed');
end