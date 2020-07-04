function    bool = frobenius(A,b)
    //Toma la matriz de coeficientes y la matriz columna respectiva, juntándolos en la matriz aumentada
    //Analiza los rangos de A y de la matriz Au aumentada
    [m,n] = size(A)
    Au = [A b]
    ranA = rank(A)
    ranAu = rank(Au)
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

function s = sustitucion_regresiva_Mcuadrada(A, b)  
    [m, n] = size(A)
    x(n) = b(n)/A(n, n)
    for i = n-1:-1:1
        suma = 0
        for j = i+1:n
            suma = suma + A(i,j)*x(j)
        end
        x(i) = ( b(i) - suma ) / A(i,i)
    end
    s = x
end
function n_matriz = intercambiarFilas(A, i, j)
    temp = A(i,:)
    A(i,:) = A(j,:)
    A(j,:) = temp
   n_matriz = A
end


function [M, s] = gauss(A, b)
     if (frobenius(A, b)) then
        [m, n] = size(A)
        for i = 1:n-1
           for j = i+1:n
                r = A(j,i)/A(i,i)
                A(j,:) = A(j,:) - r*A(i,:)
                b(j,:) = b(j,:) - r*b(i,:)
            end
        end
        s = sustitucion_regresiva_Mcuadrada(A, b)
        M = A
    end
end


function [M, s] = gauss_pivoteo(A, b)
     if (frobenius(A, b)) then
        [m, n] = size(A)
        for i = 1:n-1
        [q,p] = max(A(i:n,i))
        p = p+i-1
        A = intercambiarFilas(A, i, p)
        b = intercambiarFilas(b, i, p)

            for j = i+1:n
                r = A(j,i)/A(i,i)
                A(j,:) = A(j,:) - r*A(i,:)
                b(j,:) = b(j,:) - r*b(i,:)
            end
        end
        s = sustitucion_regresiva_Mcuadrada(A, b)
        M = A
    end
end
A = [1.2 1.2 -8.4 -8.4; -1.32 -12.12 -6.36 4.44; -12.24 2.16 6.48 -7.92]
b = [0 0 0]'
