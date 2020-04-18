clc
A = [80 15 35 60; 28 72 57 25; 20 20 12 20; 50 10 20 60]
b = [230; 180; 80;160]
x = inv(A)*b
disp('Matriz de coeficientes A:')
disp(A)
disp('Matriz b')
disp(b)
disp('Solucion X:')
disp(x)
costo = [18 5 7 20]'
c = sum(x.*costo)
disp('Costo por kg:')
disp(costo)
disp('Costo total:')
disp(c)
//cat es para añadir filas/columnas a una matriz
N = cat(1, A, zeros(1,4),zeros(1, 4))
N = [N zeros(6,1)]
N = [N zeros(6,1)]
N(2,5) = 42
N(3,6) = 21
N(5,5) = 35
N(5,6) = 25
N(6,5) = 25
N(6,6) = 30
disp(N)
