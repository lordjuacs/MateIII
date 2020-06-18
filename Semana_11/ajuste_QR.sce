function [P]=ajuste_QR(x, y, m)
// Se obtiene el polinomio que mejor ajusta los datos 
// (xi,yi), i =1,...n mediante un polinomio de grado m
// usando la factorización QR de Gram-Schmidt
n=length(x)
A = zeros(n, m+1);
for i=0:m
    A(:,i+1) = x.^i;
end
// Factorización QR de la matriz A
for k=1:m+1
    for i=1:k-1
        R(i,k)=Q(:,i)'*A(:,k);
    end
    suma=0
    for j=1:k-1
        suma = suma + R(j,k)*Q(:,j);
    end
    Q(:,k)=A(:,k)-suma
    R(k,k)=norm(Q(:,k),2);
    Q(:,k)=(1/R(k,k))*Q(:,k);   
end
coef =inv(R)*(Q'*y);
printf ('\t Los coeficientes del polinomio son : ');
disp(coef)
xx = linspace(0,3*%pi,100)';
P = poly(coef,'x','coeff')
yy = horner(P,xx);
plot(xx,yy,'b-')
endfunction

