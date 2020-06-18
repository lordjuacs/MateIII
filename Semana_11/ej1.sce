clc
    
//Generar 10 puntos de la funcion sen(x)
//[0; 3*pi]
x = linspace(0, 3*%pi, 10)'
y = 10*sin(x)
disp([x y])
//Ajuste lineal
M = [x ones(length(x),1)]
v = inv(M'*M)*M'*y
disp(v)
//Ajuste de grado 4
M = [x.^4 x.^3 x.^2 x ones(length(x),1)]
v = inv(M'*M)*M'*y
disp(v)
//Expresion en un polinomio 
p = poly(v($:-1:1), 'x','coeff')
disp(p)

//Factorizacion QR
[Q, R] = qr(M)
Q = Q(:,1:5)
R = R(1:5,:)
v = inv(R)*Q'*y
disp(v)
P = ajuste_QR(x,y,5)
disp(P)
