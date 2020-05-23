function gs=gauss_seidel(A, semilla, iteraciones, b)
    D=diag(diag(A))
    L=tril(A,-1)*-1
    U=triu(A,1)
    AA = D-L-U

    T=-inv(D-L)*U
    C=inv(D-L)*b
    //aca cambiar el vector resultado  
    for i=1:iteraciones
        semilla = T*semilla + C
    end 
    gs = semilla
endfunction


function rpta = flotante_simple(N)
    reves = []
    residuo = N
    while(residuo >= 1)
        reves = cat(1, reves,modulo(residuo,2)) 
        residuo = floor(residuo/2)
    end
    reves = reves'
    mantisa = []
    [fil col] = size(reves)
     aux = zeros(1, col)
     j = 1
     for i = col:-1:1
         aux(1,j) = reves(1, i)
         j = j +1
     end
  
    arriba = 0
    for i = 2:col
       mantisa = cat(1, mantisa, aux(1,i))
       arriba = arriba +1
    end
    mantisa = mantisa'
    MANTISA = zeros(1,23)
    [f c] = size(mantisa)
    for i=1:c
        MANTISA(1,i) = mantisa(1,i)
    end

    exponente1 = 127 + arriba
    reves2 = []
    residuo2 = exponente1
    while(residuo2 >= 1)
        reves2 = cat(1, reves2,modulo(residuo2,2)) 
        residuo2 = floor(residuo2/2)
    end
    reves2 = reves2'
    [fil2 col2] = size(reves2)
     aux2 = zeros(1, col2)
     j = 1
     for i = col2:-1:1
         aux2(1,j) = reves2(1, i)
         j = j +1
     end
     exponente = aux2
     signo = [0]
     if N < 0
        signo(1,1) =1
     end
     final = cat(2, signo, exponente, MANTISA)
     rpta = final
endfunction
clc

A = [4 -1 0 -1 0 0 0 0 0; -1 4 -1 0 -1 0 0 0 0; 0 -1 4 0 0 -1 0 0 0; -1 0 0 4 -1 0 -1 0 0; 0 -1 0 -1 4 -1 0 -1 0; 0 0 -1 0 -1 4 0 0 -1; 0 0 0 -1 0 0 4 -1 0; 0 0 0 0 -1 0 -1 4 -1; 0 0 0 0 0 -1 0 -1 4]
b = [50 20 45 20 0 35 30 20 65]'
sem = [1 1 1 1 1 1 1 1 1]'
S = round(gauss_seidel(A, sem, 5, b))

disp(A, 'Matriz  de coeficientes original')
disp(b, 'Vector columna valores')
disp(S, 'Vector propio - 5 iteraciones')
maximo = max(S)
minimo = min(S)
disp(S(5), 'Cantidad de aviones en P5')
disp(maximo, 'Cantidad máxima de aviones por portavion')
disp(minimo, 'Cantidad minima de aviones por portavion')
flotante_maximo = flotante_simple(maximo)
flotante_minimo = flotante_simple(minimo)
disp(flotante_maximo, "IEEE754 del maximo")
disp(flotante_minimo, "IEEE754 del minimo")



