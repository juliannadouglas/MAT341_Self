function plot_Nested_Times()

N = [1:1:10, 20:10:100, 125, 150, 175, 200, 225, 250];

for i=1:length(N)
    %calculates time for each value in N
    calculate_Nested_For_Loop_Time(N(i));
end

%stores times in a vector
for i=1:length(N)
    timeVec(i) = calculate_Nested_For_Loop_Time(N(i));
end

%plotting attributes
lw = 4;
fs = 18;

%loglog plot
loglog(N,timeVec, 'm', 'LineWidth', lw);
xlabel('N');
ylabel('Time');
set(gca, 'FontSize',fs);