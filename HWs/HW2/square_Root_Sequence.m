function val = square_Root_Sequence(m,n)

%initializes val
val = sqrt(m);

for i=2:n
    
    %determines correct sign
    if mod(n,2)==0
        sign = (-1)^(n+1)
    else
        sign = (-1)^n
    end
    
    %computes the sequence
    val = sqrt(m + ((-1)^i)*sign*val)
     
end

%m = 13 converges to 3
%m = 31 converges to 5
%m = 43 converges to 6