function    bool = frobenius(A,b)
    [m,n] = size(A)
    disp(m, "m:")
    Au = [A b]
    ranA = rank(A)
    ranAu = rank(Au)
    disp(ranA, "Rango Matriz Coeficientes")
    disp(ranAu, "Rango Matriz Aumentada")
    if ranA == ranAu then
        if ranA == m then
            disp("El sistema es compatible determinado")
            bool = %T
        else
            disp("El sistema es compatible indeterminado")
            bool =%F
        end
    else
        disp("El sistema no tiene solución")
        bool = %F
    end
end

clc
M = [2 5 1; 8 12 6; -4 -2 -4]

disp([0 0 0]', "Vector 1")
frobenius(M, [0 0 0]')
disp([2 8 -4]', "Vector 2")
frobenius(M, [2 8 -4]')
disp([-23 -52 6]', "Vector 3")
frobenius(M, [-23 -52 6]')
disp([5 12 -2]', "Vector 4")
frobenius(M, [5 12 -2]')
disp([-3 1 -1]', "Vector 5")
frobenius(M, [-3 1 -1]')
