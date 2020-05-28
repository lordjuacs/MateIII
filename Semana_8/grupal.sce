clc
Morig = [6 5 3; 3 3 2;1 1 1]
aux = [1 1 1; 0 1 1; 0 0 1]
A = inv(aux)*Morig
disp(A, "A")

[Q,D]= spec(A)
disp(D, "Valores propios")
disp(Q, "Vectores propios")
//pot = potencia(A, [1 0 0]', 1e-3)
//disp(pot)
//2.
//A*X = lambda*X
//inv(A)*X=(1/lambda)*X
E = inv(A)
x0 = [1;0;0]
//iteracion 1
y1 = E*x0
[maxi, pos] = max(abs(y1))
w = y1(pos) //w = 1/lambda
u = 1/w
disp(u, "Valor propio (minimo)")
x1 = y1/w
disp(x1, "Vector propio")
//iteracion 2
y2 = E*x1
[maxi, pos] = max(abs(y2))
w = y2(pos) //w = 1/lambda
u = 1/w
disp(u, "Valor propio (minimo)")
x2 = y2/w
disp(x2, "Vector propio")

