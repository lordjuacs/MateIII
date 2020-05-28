//Valores y vectores propios
clc
A = [1 4 3; 2 1 8; 2 5 9]
disp(A)
//spec() saca de frente valores  propios
vp = spec(A)
disp(vp)
//spec(), con 2 parametros de salida:
//R es una matriz, cada columna es un vector propio
//D es una matriz diagonal, cada valor corresponde a un vector propio
[R, D] = spec(A)
disp(R)
disp(D)
//Verificando
vp1 = A*R(:, 1)
vp2 = D(1,1)*R(:, 1)

disp(vp1)
disp(vp2)
//Polinomio caracteristico
t = spec(A)
policar = poly(t', "lambda", "roots")
disp(policar)
