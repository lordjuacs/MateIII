//Sistemas de Ecuaciones Lineales
//Ax = b
clc
A = [3 1 1;2 8 6; 1 3 10]
b = [6 24 17]'
[L,U] = lu(A)
disp(L, "L")
disp(U, "U")

//Resolución "abusando" de comandos de Scilab
//Ax = b --> (LU)x = b
//L(Ux) = b; Ux = z
//Lz = b ...(I)
//Ux = z ...(II)
z = L\b //Lo vamos a reemplazar con susti_dir
disp(z, "z")
x = U\z //Lo vamos a reemplazar con susti_in
disp(x, "x")
//Invocando a la función doolittle
[L,U]=doolittle(A)
disp(L, "L")
disp(U, "U")
//Invocando a la función sust_dir
z = susti_dir(L,b)
disp(z, "z")
x = susti_in(U,z)
disp(x, "x")
//Factorización de Crout
[L,U]=crout(A)
disp(L,"L")
disp(U, "U")

