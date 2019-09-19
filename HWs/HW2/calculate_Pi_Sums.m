function calculate_Pi_Sums()

%set tolerance value and initialize necessary variables
tol = 1e-6;
erra = 1;
errb = 1;
na = 0;
nb = 0;

while erra > tol
    na = na + 1;
    a = 0;
    
    %computes sum A
    for i=0:na
        a = a + (6/sqrt(3))*(((-1)^i)/((3^i)*(2*i+1)))
    end
   
   %computes error for A
   erra = abs(a-pi);
end

while errb > tol
    nb = nb + 1;
    b = 0;
    
    %computes sum B
    for i=0:nb
      b = b + 16*(((-1)^i)/((5^(2*i+1))*(2*i+1))) - 4*(((-1)^i)/((239^(2*i+1))*(2*i+1)))
    end
    
    %computes error for B
    errb = abs(b-pi);
end

%prints out amount of terms each sum takes
na
nb