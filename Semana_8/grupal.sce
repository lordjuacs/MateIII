function [minimo, propio] = potencia_inversa(A,x0, Tol)
    error = 1
    E = inv(A)

    while error> Tol
        aux = E*x0
        [maxi, pos] = max(abs(aux))
        auxval = aux(pos)
        x1 = aux/auxval
        error=norm(x1-x0)/norm(x1)
        x0 = x1
    end
    minimo = 1 / auxval
    propio = x0
endfunction
function op = verificadiagdom(A)
    [m, n] = size(A)
    op = 1
    for k=1:n
        if abs(A(k,k)) < = sum(abs(A(k,:))) - abs(A(k,k))
            op = 0
            break
        end
    end
endfunction



clc
Morig = [6 5 3; 3 3 2;1 1 1]
aux = [1 1 1; 0 1 1; 0 0 1]
A = inv(aux)*Morig
disp(A, "A")

[Q,D]= spec(A)
disp(D, "Valores propios")
disp(Q, "Vectores propios")

[minimo, propio] = potencia_inversa(A, [1;0;0],1e-3)
disp(minimo, "Valor propio minimo - potencia inversa")
disp(propio, "Vector propio - potencia inversa")
    //pot = potencia(A, [1 0 0]', 1e-3)
    //disp(pot)
    //2.
    //A*X = lambda*X
    //inv(A)*X=(1/lambda)*X
    //E = inv(A)
   // x0 = [1;0;0]
    //iteracion 1
   // y1 = E*x0
   // [maxi, pos] = max(abs(y1))
   // w = y1(pos) //w = 1/lambda
   // u = 1/w
   // disp(u, "Valor propio (minimo)")
   // x1 = y1/w
  //  disp(x1, "Vector propio")
   // //iteracion 2
    //y2 = E*x1
    //[maxi, pos] = max(abs(y2))
   // w = y2(pos) //w = 1/lambda
  //  u = 1/w
   // disp(u, "Valor propio (minimo)")
  //  x2 = y2/w
  //  disp(x2, "Vector propio")
  
  
 disp(A, "A")
 b = [1 1 1]'
 disp(b, "b")
D  = diag(diag(A))
L = -tril(A, -1)
U = -triu(A, 1)
Tj = inv(D)*(L+U)
Tgs = inv(D-L)*U
disp("Metodo de Jacobi")
rhoj = max(abs(spec(Tj)))
disp(rhoj)
disp("No converge, |radio espectral| > 1 ")
disp("Metodo de Jacobi")
rhogs = max(abs(spec(Tgs)))
disp(rhogs)
disp("Si converge, |radio espectral| < 1 ")

