function [L,U] = doolittle(A)
    [m,n] = size(A)
    U = A;
    L = eye(n,n);
    for k=1:n-1
        pivot = U(k,k)
        for j = k+1:n
            L(j,k)= U(j,k)/pivot
            U(j,:)=U(j,:)-L(j,k)*U(k,:)
        end
    end
endfunction
