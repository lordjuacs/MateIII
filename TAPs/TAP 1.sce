clc
disp('MATEMÁTICAS III - CICLO 2020-1')
disp('Sección 1.01')
disp('TAP 01')
disp('Profesor: Hermes Pantoja')
disp('Integrantes:')
disp('Gino Camizán      100%')
disp('Mayra Díaz        100%')
disp('José Porres       100%')
disp('Joaquín Ramírez   100%')
disp('')
function    bool = frobenius(A,b)
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

function s = sustitucion_progresiva_Mcuadrada(A, b)
    [m, n] = size(A)
    x(1) = b(1)/A(1, 1)
    for i = 2:n
        suma = 0
        for j = i-1:-1:1
            suma = suma + A(i,j)*x(j)
        end
        x(i) = ( b(i) - suma ) / A(i,i)
    end
    s = x
end


function [L, U] = factorizacion_Crout(A)
        
        [R, C] = size(A);
        for i = 1:R
            L(i, 1) = A(i, 1);
            U(i, i) = 1;
        end
        for j = 2:R
            U(1, j) = A(1, j) / L(1, 1);
        end
        for i = 2:R
            for j = 2:i
                L(i, j) = A(i, j) - L(i, 1:j - 1) * U(1:j - 1, j);
            end
            
            for j = i + 1:R
                U(i, j) = (A(i, j) - L(i, 1:i - 1) * U(1:i - 1, j)) / L(i, i);
            end
        end
   end


function [L, U, x] = solucion_Crout(A, b)
    if (frobenius(A, b)) then
        [L, U] = factorizacion_Crout(A)
        disp(L, "L:")
        disp(U, "U: ")

        z = sustitucion_progresiva_Mcuadrada(L, b)
        disp(z, "Reemplazando con matriz lower (Z): ")
        x= sustitucion_regresiva_Mcuadrada(U, z)
        disp(x, "Resultado final X: ")
    end
end

function [L, U] = factorizacion_Doolittle(A)
    [m,n]=size(A);
    U = A
    L = eye(n,n)
    for k = 1:n-1
        for j = k+1:n
            L(j,k) = U(j,k)/U(k,k)
            U(j,:) = U(j,:) - L(j,k)*U(k,:)
        end
    end
end

function [L, U, x] = solucion_Doolittle(A, b)
    if (frobenius(A, b)) then
        [L, U] = factorizacion_Doolittle(A)
        disp(U, "U: ")
        disp(L, "L:")

        z = sustitucion_regresiva_Mcuadrada(U, b)
        disp(z, "Reemplazando con matriz upper (Z): ")
        x= sustitucion_progresiva_Mcuadrada(L, z)
        disp(x, " Resultado final (X): ")
    end
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



disp("EJERCICIO A")
disp("Sistema de ecuaciones: ")
disp("512 x5 - 12 x4 = 0", "512 x4 - 12 x3 - 500 x5 = 0", "512 x3 - 12 x2 - 500 x4 = 0", "512 x2 - 12 x1 - 500 x3 = 0", "512 x1 - 9 - 500 x2 = 0")


disp("EJERCICIO B")
b1 = [512 -500 0 0 0;
-12 512 -500 0 0;
0 -12 512 -500 0;
0 0 -12 512 -500;
0 0 0 -12 512]
b2 = [9; 0; 0; 0; 0]
disp("A:")
disp(b1)
disp("b:")
disp(b2)
disp([b1 b2], "Matriz aumentada: ")


disp("EJERCICIO C")
[c1, c2] = gauss_pivoteo(b1, b2)
disp(c1, "Matriz después de la eliminación gaussiana: ")
disp(c2,"Solución X:")
platoc1 = 512*c2(1,1) - 500*c2(2,1)
platoc2 = 512*c2(2,1) - 500*c2(3,1)
platoc3 = 512*c2(3,1) - 500*c2(4,1)
platoc4 = 512*c2(4,1) - 500*c2(5,1)
platoc5 = 512*c2(5,1)
disp(platoc1, "Plato 1:")
disp(platoc2, "Plato 2:")
disp(platoc3, "Plato 3:")
disp(platoc4, "Plato 4:")
disp(platoc5, "Plato 5:")

disp("EJERCICIO D")
d1 = [512 -500 0 0 0;
-12 512 -500 0 0;
0 -12 637 -625 0;
0 0 -12 512 -500;
0 0 0 -12 512]
d2 = [9; 0; 0; 0; 0]
disp([d1 d2], "Matriz aumentada:")
disp("Según la teoría de Frobenius: ")
[d3, d4, d5] = solucion_Doolittle(d1, d2)
platod1 = 512*d5(1,1) - 500*d5(2,1)
platod2 = 512*d5(2,1) - 500*d5(3,1)
platod3 = 637*d5(3,1) - 625*d5(4,1)
platod4 = 512*d5(4,1) - 500*d5(5,1)
platod5 = 512*d5(5,1)
disp(platod1, "Plato 1:")
disp(platod2, "Plato 2:")
disp(platod3, "Plato 3:")
disp(platod4, "Plato 4:")
disp(platod5, "Plato 5:")




disp("EJERCICIO E")

e1 = [615 -600 0 0 0 0;
-15 615 -600 0 0 0;
0 -15 615 -600 0 0;
0 0 -15 615 -600 0;
0 0 0 -15 615 -600;
0 0 0 0 -15 615]
e2 = [11.25; 0; 0; 0; 0; 0]
disp([e1 e2], "Matriz aumentada:")
[e3, e4, e5] = solucion_Crout(e1, e2)


disp("EJERCICIO F")
[m, n] = size(e1)
f1 = ones(n, n)
for i = 1:n
    for j = 1:n
        if i == j then
            f1(i, j) = e1(i, j) - (i*j)
        else 
            f1(i, j) = e1((7-i), j) -1
        end
   end
end
disp(f1, "Matriz P: ")


disp("EJERCICIO G")
g1 = f1'
disp([f1 e2], "Matriz aumentada del sistema P^t . X = B")
[g2, g3] = gauss(f1, e2)
disp(g2, "Matriz después de la eliminación gaussiana: ")
disp(g3, "Solución")


disp("EJERCICIO H")
[h1, h2] = factorizacion_Doolittle(f1)
disp(h2, "U:")
disp(h1, "L: ")


disp("EJERCICIO I")
disp([f1 e2], "Matriz aumentada del sistema P.X = B")
[i1, i2, i3] = solucion_Crout(f1, e2)

