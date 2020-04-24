function [L,U] = crout(A)
    [m,n] = size(A)
    L = A;
    U = eye(n,n);
    for k=1:n-1
        pivot = L(k,k)
        for j = k+1:n
            U(k,j)= L(k,j)/pivot
            L(:,j)=L(:,j)-U(k,j)*L(:,k)
        end
    end
endfunction
