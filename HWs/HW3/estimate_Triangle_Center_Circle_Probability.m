function prob = estimate_Triangle_Center_Circle_Probability(N)
%the probability is about 0.148

%initializes counter and radius
count = 0;
r = 2;

%loop runs N times
for i=1:N
    
    %provides random x values between -2 and 2
    x1 = 4*rand() - 2;
    x2 = 4*rand() - 2;
    x3 = 4*rand() - 2;
    
    %generates random numbers for the sign
    s1 = rand();
    s2 = rand();
    s3 = rand();
    
    %assigns sign to be either positive or negative
    if s1 < 0.5
        s1 = 1;
    else
        s1 = -1;
    end
    
    if s2 < 0.5
        s2 = 1;
    else
        s2 = -1;
    end
    
    if s3 < 0.5
        s3 = 1;
    else
        s3 = -1;
    end
    
    %computes the y values for each x value
    y1 = s1 * sqrt(r^2 - x1^2);
    y2 = s2 * sqrt(r^2 - x2^2);
    y3 = s3 * sqrt(r^2 - x3^2);
    
    %determines whether the origin is in the triangle
    if origin_In_Triangle(x1,y1,x2,y2,x3,y3) == 1
        count = count + 1;
    end
end

%probability is total number of successes out of total trials
prob = count/N;
end

%determines whether the origin is in the triangle or not
%If you draw it out on paper, it is easy to see that if the origin is in
%the triangle, then three triangles can be formed with two points and the
%origin. These three triangles make up the whole triangle, so if we add
%their areas together, we will get the area of the whole triangle. If the
%origin is not in the triangle, then the three triangles will not be equal
%to the whole triangle, so the sum of the areas will be different from the
%area of the whole triangle.
function inCircle = origin_In_Triangle(x1,y1,x2,y2,x3,y3)
aT = area(x1,y1,x2,y2,x3,y3);
a1 = area(0,0,x2,y2,x3,y3);
a2 = area(x1,y1,0,0,x3,y3);
a3 = area(x1,y1,x2,y2,0,0);

if aT == a1+a2+a3
    inCircle = 1;
else
    inCircle = 0;
end
end

%computes the area of the triangle
function ar = area(x1,y1,x2,y2,x3,y3)
ar = abs((x1*(y2-y3)+x2*(y3-y1)+x3*(y1-y2))/2);
end