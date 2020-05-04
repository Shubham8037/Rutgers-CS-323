%% Dett Function computes determinant using Gaussian Elimination Method
% Input: Matrix A
% Output: Determinant k
function k = Dett(A)
n = size(A,1);          % No. of row/columns in A
sign = 1;
for i = 1:n-1
    if A(i,i) == 0
        if k > i && A(k,i) ~= 0
            A(k,:) = A(i,:);
            sign = -1*sign;
        else
            return
        end
    else
        for j = i+1:n
            A(j,:) = A(j,:) - A(j,i)/A(i,i)*A(i,:);
        end
    end
end
det1 = sign;
for i = 1:n
    det1 = det1*A(i,i);
end
k=det1;