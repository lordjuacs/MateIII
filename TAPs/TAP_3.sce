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

vec1 = [2 9 -2]'
val1 = -8
vec2 = [1 0 -1]'
val2 = 1
vec3 = [7 4 5]'
val3 = 3
disp("TAP 03 - MATEMÁTICAS III - SECCIÓN 1.01")
disp("Pregunta A")
disp(vec1, "Vector propio")
disp(val1, "Valor propio")
disp(vec2, "Vectori propio")
disp(val2, "Valor propio")
disp(vec3, "Vectori propio")
disp(val3, "Valor propio")
objetivo = [4000 0 -4000]'
disp(objetivo, "Coordenada para dar el objetivo")
disp(sum(objetivo), "Suma de coordenada para dar el objetivo")  

disp("Pregunta B")
disp(0.4419, "Aceleración")
impacto = [100 450 -100]'
disp("Pregunta C")
disp(impacto, "Coordenada de impacto")
disp(sum(impacto), "Suma de coordenada de impacto")
disp("Pregunta D")
disp(4.717, "Aceleración")
disp("Pregunta E")
A = [4 -1 0 -1 0 0 0 0 0; -1 4 -1 0 -1 0 0 0 0; 0 -1 4 0 0 -1 0 0 0; -1 0 0 4 -1 0 -1 0 0; 0 -1 0 -1 4 -1 0 -1 0; 0 0 -1 0 -1 4 0 0 -1; 0 0 0 -1 0 0 4 -1 0; 0 0 0 0 -1 0 -1 4 -1; 0 0 0 0 0 -1 0 -1 4]
disp(A, 'Matriz  de coeficientes original')
b = [50 20 45 20 0 35 30 20 65]'
sem = [1 1 1 1 1 1 1 1 1]'
S = gauss_seidel(A, sem, 5, b)


disp(b, 'Vector columna valores')
disp("Pregunta F")
disp("Funcionas en el código TAP_3.sce")
disp("Pregunta G")
disp(S, 'Vector propio - 5 iteraciones')
disp(round(S), 'Vector propio (aproximando a valores enteros) - 5 iteraciones')
S = round(S)
maximo = max(S)
minimo = min(S)
disp(S(5), 'Cantidad de aviones en P5')
disp("Pregunta H")
disp(maximo, 'Cantidad máxima de aviones por portavion')
disp(minimo, 'Cantidad minima de aviones por portavion')
flotante_maximo = flotante_simple(maximo)
flotante_minimo = flotante_simple(minimo)
disp(flotante_maximo, "IEEE754 del maximo")
disp(flotante_minimo, "IEEE754 del minimo")



