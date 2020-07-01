function I = simpson_compuesto(f, a, b, n)
    if modulo(n, 2) == 0 then
        h = (b-a)/n
        x = [a:h:b]
        l = length(x)
        xpar = x(2:2:l-1)
        ximpar = x(3:3:l-2)
        I = (h/3)(f(a)+4sum(f(xpar))+2sum(f(ximpar))+f(b))
    else
        disp('n debe ser par')
        I = 0
    end
endfunction
