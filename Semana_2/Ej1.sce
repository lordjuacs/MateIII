//Ejemplo 1
clc
A=[1 2 -3; -3 -1 1; 1 -1 1]
b=[5;-8;0]
disp(A)
disp(b)
//Resolviendo
x = inv(A)*b
disp(x)
x = A\b
disp(x)
x = linsolve(A, -b)
disp(x)
//Consistencia de un sistema de ecuaciones
Aa=[A b]
disp(Aa)
rangoA = rank(A)
disp(rangoA)
rangoAa = rank(Aa)
disp(rangoAa)
[m,n]=size(A)
if rangoA==rangoAa then
    disp('Sistema es consistente')
    if rangoA==n
        disp('Determinado')
    else
        disp('Indeterminado')
    end
else
    disp('Sistema es inconsitente')
end
