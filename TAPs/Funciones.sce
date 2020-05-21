//funciones


//FROBENIUS
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


//SUSTITUCIÓN DIRECTA
function x=sustidir(L,b)
    [m,n]=size(L)
    x=zeros(n,1)
    for k=1:n
        x(k)=(b(k)-(sum(L(k,1:k-1)*x(1:k-1))))/L(k,k)
    end
endfunction


//SUSTITUCIÓN INVERSA
function x =sustinv(U,b)
    [m,n]=size(U)
    x=zeros(n,1)
    for k=n:-1:1
        x(k)=(b(k)-(sum(U(k,k+1:n)*x(k+1:n))))/U(k,k)
    end
endfunction


//CROUT
function[L,U]= crout(A)
    [m,n]=size(A)
    L=A
    U=eye(n,n)
    for k=1:n-1
        pivot=L(k,k)
        for j=k+1:n
            U(k,j)=L(k,j)/pivot
            L(:,j)=L(:,j)-U(k,j)*L(:,k)
        end
    end
endfunction


//DOOLITTLE
function[L,U]= doolitle(A)
    [m,n]=size(A)
    U=A
    L=eye(n,n)
    for k=1:n-1
        pivot=U(k,k)
        for j=k+1:n
            L(j,k)=U(j,k)/pivot
            U(j,:)=U(j,:)-L(j,k)*U(k,:)
        end
    end
endfunction


//ELIMINACIÓN GAUSSIANA
function [M, s] = gauss(A, b)
    [m,n] = size(A)
    for i = 1:n-1
        for j = i+1:n
            r = A(j,i)/A(i,i)
            A(j,:) = A(j,:) - r*A(i,:)
            b(j,:) = b(j,:) - r*b(i,:)
        end
    s = sustinv(A, b)
    M = A
endfunction


//ELIMINACIÓN GAUSSIANA  CON PIVOTEO
function [M, s] = gaussPiv(A, b)
    [m,n] = size(A)
    for i = 1:n-1
        // Pivotacion parcial
        [q,p] = max(A(i:n,i))
        p = p+i-1
        A = intercambiarFilas(A, i, p)
        b = intercambiarFilas(b, i, p)

        // Triangularizacion
        for j = i+1:n
            r = A(j,i)/A(i,i)
            A(j,:) = A(j,:) - r*A(i,:)
            b(j,:) = b(j,:) - r*b(i,:)
        end
    end
    s = sustinv(A, b)
    M = A
endfunction

//PARA EL PIVOTEO
function rpta = intercambiarFilas(A, i, j)
    temp = A(i,:)
    A(i,:) = A(j,:)
    A(j,:) = temp
    rpta = A
endfunction
