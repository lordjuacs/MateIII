clear
clc
function z = puntofijo(f,x0,maxiter)
    z = [x0]
    for k=1:maxiter
        x1=f(x0)
        z=[z;x1]
        x0 = x1
    end
endfunction
function z = puntofijo2(g,x0,Tol)
    z = [x0]
    err=1
    while err>Tol
        x1=g(x0)
        z=[z;x1]
        err=abs((x1-x0)/x1)
        x0 = x1  
    end
endfunction


deff('y=g(x)', 'y=sqrt(sin(x)+1)')
x0 = 0
z = puntofijo2(,x0,1e-3)
disp(z,"y")


