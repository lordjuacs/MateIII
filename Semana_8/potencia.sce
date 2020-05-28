function [valor, vector] = potencia(A,x0, Tol)
    vector = x0
    A = inv(A)
    error = 1
    while error> Tol
        x1 = A*x0
        [maxi,pos] = max(abs(vector))
        valor = 1/x1(pos)
        x1 = x1 /valor
        valor = 1/valor
        
        error=norm(x1-x0)/norm(x1)
        //disp(error, "error")
        x0 = x1
        vector = x1
    end
    disp(valor, "Valor")
    disp(vector, "Vector")
endfunction
