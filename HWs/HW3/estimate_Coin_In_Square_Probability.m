function prob = estimate_Coin_In_Square_Probability(r,N)
%According to my calculated probabilities, it seems that N=1e5 is enough
%trials. I seem to be getting a probability of about 0.444, even when I
%increase N to 1e8. This is more difficult than the coin flip we did in
%class because we can vary more things, such as the radius of the circle,
%and determining how likely this is to happen is much more complex than a
%coin flip.

%initializes counter
count = 0;

%loop runs N times
for i=1:N
    %generates random (x,y) for the center of the coin so that at least
    %part of the coin will land inside the square. range for x & y goes
    %from -r to 1+r
    x = (2*r + 1)*rand() - r;
    y = (2*r + 1)*rand() - r;
    
    %if the lowest x value of the circle is > 0, greatest x value of the
    %circle is < 1, and same for the y, then the whole circle is inside the
    %square, so we increase the counter
    if x-r>0 && x+r<1 && y-r>0 && y+r<1
        count = count + 1;
    end 
end

%takes the total number of successes and divides by the total number of
%trials
prob = count/N;