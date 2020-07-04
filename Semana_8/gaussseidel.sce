function z = gaussseidel(A, b, x0, Tol)
    z = [x0']
    error = 1
    D  = diag(diag(A))
    L = -tril(A, -1)    
    U = -triu(A, 1)
    Tgs = inv(D-L)*U
    cgs = inv(D-L)*b
    while error> Tol
        x1 = Tgs*x0 + cgs
        z = [z; x1']
        error=norm(x1-x0)/norm(x1)
        //disp(error, "error")
        x0 = x1
    end
endfunction
