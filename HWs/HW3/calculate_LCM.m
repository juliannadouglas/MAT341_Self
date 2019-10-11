function lcm_val = calculate_LCM(x,y)
%initializes lcm
lcm = 0;

%loop runs from 1 up until the product of x and y
for i=1:x*y
    %if i/x and i/y both have no remainder, then the lcm is set equal to i
    %and then it exits the code
    if floor(i/x)==(i/x) && floor(i/y)==(i/y)
        lcm = i;
        break
    end
end

lcm_val = lcm;