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
M = [2 -1 4; -4 2 -8]
disp("Ej 1:")
disp(M, "Matriz asociada")

disp("Ej 2:")
X = [0 0 0]'
N = M*X
disp(N, "N")

//disp("Ej 3:")
//disp(M* [0 0 0]')
//disp(M *[1 0 0]')
//disp(M * [0 0 1]')

disp("Ej 4:")
frobenius(M, [1, 3]')
