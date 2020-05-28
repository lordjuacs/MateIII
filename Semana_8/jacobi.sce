function z = jacobi(A, b, x0, Tol)
    z = [x0']
    error = 1
    D  = diag(diag(A))
    L = -tril(A, -1)
    U = -triu(A, 1)
    Tj = inv(D)*(L+U)
    cj = inv(D)*b
    while error> Tol
        x1 = Tj*x0 + cj
        z = [z; x1']
        error=norm(x1-x0)/norm(x1)
        disp(error, "error")
        x0 = x1
    end
endfunction
