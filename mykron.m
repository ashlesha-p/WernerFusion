function CX = mykron(A,B)
%https://algassert.com/impractical-experiments/2015/05/17/Treating-Controls-like-Values.html
% works only if B is I or X
[r1,c1] = size(A);
[r2,c2] = size(B);

CX = zeros(r1*r2,c1*c2);
for i = 1:r1
    for j = 1:c1
        if A(i,j)~=-1
            CX(2*(i-1)+1:2*i,2*(j-1)+1:2*j) = A(i,j)*B;
        else
            CX(2*(i-1)+1:2*i,2*(j-1)+1:2*j) = -eye(2);
        end
            
    end
end

end