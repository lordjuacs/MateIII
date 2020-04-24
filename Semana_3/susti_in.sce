function x = susti_in(U, b)
    [m,n]=size(U)
    x = zeros(n,1)
    for k=n:-1:1
        x(k)=(b(k)-sum(U(k, k+1:n)*x(k+1:n)))/U(k,k)
    end
     
endfunction
