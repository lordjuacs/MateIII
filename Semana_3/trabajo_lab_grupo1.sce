function [L,U] = crout(A)
    [m,n] = size(A)
    L = A;
    U = eye(n,n);
    for k=1:n-1
        pivot = L(k,k)
        for j = k+1:n
            U(k,j)= L(k,j)/pivot
            L(:,j)=L(:,j)-U(k,j)*L(:,k)
        end
    end
endfunction
function [L,U] = doolittle(A)
    [m,n] = size(A)
    U = A;
    L = eye(n,n);
    for k=1:n-1
        pivot = U(k,k)
        for j = k+1:n
            L(j,k)= U(j,k)/pivot
            U(j,:)=U(j,:)-L(j,k)*U(k,:)
        end
    end
endfunction
function x = susti_in(U, b)
    [m,n]=size(U)
    x = zeros(n,1)
    for k=n:-1:1
        x(k)=(b(k)-sum(U(k, k+1:n)*x(k+1:n)))/U(k,k)
    end
     
endfunction
function x = susti_dir(L, b)
    [m,n]=size(L)
    x = zeros(n,1)
    for k=1:n
        x(k)=(b(k)-sum(L(k, 1:k-1)*x(1:k-1)))/L(k,k)
    end
     
endfunction


//d1=1800kg/m^3, d2=1600kg/m^3, d1=1200kg/m^3,  

//densidad = masa/volumen = masa /(pi*(D/2)^2 * altura)
//Tipo A : L1=0.04m, L2=0.06m, L3=0.07m, W=0.1644pikg 
//Tipo B : L1=0.05m, L2=0.09m, L3=0.14m, W=0.2772pikg 
//Tipo C : L1=0.06m, L2=0.12m, L3=0.2m, W=0.3792pikg 
//Forma general: L1d1D1 + L2d2D2 + L3d3D3 = (4/pi)*W
//Tipo A : 0.04*1800D1^2 + 0.06*1600D2^2 + 0.07*1200D3^2 = (4/pi)*0.1644pi 
//Tipo B : 0.05*1800D1^2 + 0.09*1600D2^2 + 0.14*1200D3^2 = (4/pi)*0.2772pi  
//Tipo C : 0.06*1800D1^2 +0.12*1600D2^2 + 0.2*1200D3^2 = (4/pi)*0.3792pi  


clc
disp("MATE III  SECCIÓN 1   SEMANA 3    GRUPO 1")
M =[72 96 84;90 144 168;108 192 240]
b = [0.6576 1.1088 1.5168]'
disp(M, "M")
disp(b, "b")

disp("Pregunta 1. Factorizando por Crout")
[Lc, Uc] = crout(M)
disp(Lc, "L")
disp(Uc, "U")
disp(trace(Lc), "Traza de L")

disp("Pregunta 2. Factorizando por Doolittle")
[Ld, Ud] = doolittle(M)
disp(Ld, "L")
disp(Ud, "U")
disp(trace(Ud), "Traza de U")

//M*D = b
//Lc*Uc*D = b
//Lc*z=b
//Uc*D=z
zc = susti_dir(Lc, b)
Dc = susti_in(Uc, zc)
disp(zc, "Pregunta 3. Z Crout")
disp(Dc, "D Crout")
disp(sum(zc), "Suma Z Crout")

//M*D = b
//Ld*Ud*D = b
//Ld*z=b
//Ud*D=z
zd = susti_dir(Ld, b)
Dd = susti_in(Ud, zd)
disp(zd, "Pregunta 4. Z Doolittle")
disp(Dd, "D Doolittle")
disp(sum(zd), "Suma Z Doolittle")

//Se comprueba que tanto con Crout que con Doolittle, D es la misma

diam = Dc^.5
disp("Diámetros (en m)")
disp(diam(1), "D1 = diámetro de A")
disp(diam(2), "D2 = diámetro de B")
disp(diam(3), "D3 = diámetro de C")

disp("Diámetros (en cm)")
disp(diam(1)*100, "D1 = diámetro de A")
disp(diam(2)*100, "D2 = diámetro de B")
disp(diam(3)*100, "D3 = diámetro de C")


disp("Nota:")
printf("\n Si consideramos la imagen del PPT, en el que el cilindro C\n ingresa al cilindro B, y el B al A, entonces no se podría\n dar ese caso de pieza sólida, puesto que el diámetro de C\n es mayor al de B, y el de B mayor al de A.\n\n")
printf(" Sin embargo, se puede plantear que cambie el orden. Es\n decir, el cilindro A ingresa al B, y el B al C. En\n dicho caso la pieza sólida sí encajaría.\n")
disp("Pregunta 5.")
printf(" Sí se podría unir una cilindro de diámetro interno de\n 5,01 cm con la pieza sólida de tipo A,B y C, pues\n encajaría entre el cilindro C (diámetro de 6 cm) y\n el B (diámetro de 5 cm).")
disp("Orden (de cilindros): C ---> Nuevo ---> B ---> A")
disp("Diámetro (en cm):     6 --->  5,01 ---> 5 ---> 4")

