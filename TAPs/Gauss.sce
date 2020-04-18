function rpta = intercambiarFilas(A, i, j)
    temp = A(i,:)
    A(i,:) = A(j,:)
    A(j,:) = temp
    rpta = A
endfunction


function [] = Gauss(A, b)
    [m n] = size(A)
    Au = [A b]
    x = zeros(n,1)
    for p=1:m
        for k=1:p-1
    end
    
endfunction

