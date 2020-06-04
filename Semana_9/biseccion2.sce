function z=biseccion2(f,a,b,Tol)
    c=(a+b)/2
    err=(b-a)/2
    z=[a b c f(a) f(b) f(c) err]
    n=ceil(log2((b-a)/(2*Tol)))
    while err>Tol
        if f(a)*f(c)<0
              b=c
          else
              a=c
        end
        c=(a+b)/2
        err=(b-a)/2 
        z=[z;a b c f(a) f(b) f(c) err ]
    end
    printf('Se tiene %d iteraciones',n)
endfunction

