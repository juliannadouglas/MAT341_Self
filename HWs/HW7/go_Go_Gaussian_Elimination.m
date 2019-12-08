function OpCount = go_Go_Gaussian_Elimination(N)
%initialize counter
counter = 0;
%makes N by N matrix of random values
A = rand(N,N);

%initializes i and j for while loop
i = 1;
j = 1;

%row reduce loop
while (i<=N) && (j<=N)
    %checks if pivot position isnt 0. If 0, switches rows and incriments
    %counter
    if A(i,j)==0
        temp1 = A(i+1,:);
        A(i,:) = A(i+1,:);
        A(i+1,:) = temp1;
        counter = counter + 1;
    end
    
    %checks if pivot position is 1. If not, divides row by pivot value and
    %incriments counter
    if A(i,j)~=1
        A(i,:) = A(i,:)/A(i,j);
        counter = counter + 1;
    end
    
    %checks if values under pivot are 0. If not, they are made to be 0 and
    %increments counter
    for k=i+1:N
        if A(k,j)~=0
            A(k,j) = A(k,j) - A(i,j)*A(k,j);
            counter = counter + 1;
        end
    end
    
    %next pivot position
    i = i + 1;
    j = j + 1;
end

%prints resulting row reduced matrix
A
%reset values
q = N - 1;
p = N - 1;

%while loop to get rref matrix
while (q>0) && (p>0)
    for k=q:-1:1
        for l=p:-1:1
            %checks if numbers to right of pivots are 0. If  not, change to
            %0 and increment counter
            if A(k,p+1)~=0
                A(k,p+1) = A(k,l+1) - A(k,l+1)*A(k+1,l+1);
                counter = counter + 1;
            end
        end
    end
    %decrement q and p for previous pivot position
    q = q - 1;
    p = p - 1;
end

%print resulting matrix and print return value
A
OpCount = counter;
end

% As the size of the matrix goes up, it appears that the number of
% iterations increases in a quadratic pattern, but in the loglog plot we see a
% linear pattern.