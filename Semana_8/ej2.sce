
clc
//Métodos numéricos
A = [3 2 1; 5 3 2; 1 8 3]
D  = diag(diag(A))
L = -tril(A, -1)
U = -triu(A, 1)
disp(D)
disp(L)
disp(U)
op = verificadiagdom(A)
if op == 1 then
    printf("El metodo iterativo es convergente")
else
    printf("No se puede afirmar nada")
end

Tj = inv(D)*(L+U)
disp(Tj)
Tgs = inv(D-L)*U
disp(Tgs)
//radio espectral
rhoj = max(abs(spec(Tj)))
disp(rhoj)
rhogs = max(abs(spec(Tgs)))
disp(rhogs)
