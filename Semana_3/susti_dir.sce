function x = susti_dir(L, b)
    [m,n]=size(L)
    x = zeros(n,1)
    for k=1:n
        x(k)=(b(k)-sum(L(k, 1:k-1)*x(1:k-1)))/L(k,k)
    end
     
endfunction
