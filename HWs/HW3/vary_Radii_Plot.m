function vary_Radii_Plot()
%A radius of about 0.1 gives a probability of 0.5. A radius of about 0.25
%gives a probability of 0.1. A radius of about 0.4 gives a probability of
%0.01.

%initializes radius vector, an empty probability vector, and sets N
rVec = [0.01:0.005:0.10 0.1:0.01:0.5];
probVec = [];
N = 1e5;

%loop runs for as many elements as there are in the radius vector
%each element in the probability vector comes from the probabilities for
%each radius in the radius vector
for i=1:length(rVec)
   probVec(i) = estimate_Coin_In_Square_Probability(rVec(i),N);
end

%plots probability vs radius
plot(rVec,probVec);