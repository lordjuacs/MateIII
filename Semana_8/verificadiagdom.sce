function op = verificadiagdom(A)
    [m, n] = size(A)
    op = 1
    for k=1:n
        if abs(A(k,k)) < = sum(abs(A(k,:))) - abs(A(k,k))
            op = 0
            break
        end
    end
endfunction
