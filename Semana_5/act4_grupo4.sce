function mayor = MAYOR(y0)
    [m,n] = size(y0)
    mayor = 0
    for j=1:m
        if abs(y0(j,1)) > abs(mayor)
            mayor = y0(j,1)
            end
    end
endfunction
clc
A = [2 -12;1 -5]
x = [1 1]'
y = A*x

disp(y0, "y0")
for i=1:10
   y = A*x
   valor = MAYOR(y)
   x = y/valor   
end
disp(y,"y - 10 iteraciones")
disp(x, "vector propio - 10 iteraciones")
disp(valor, "valor propio - 10 iteraciones")

