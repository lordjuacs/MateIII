function z = biseccion(f, a, b, maxiter)
    c = (a + b)/2
    error=(b-a)/2
    z = [a b c f(a) f(b) f(c) error]
    for k=1:maxiter
        if f(a)*f(c) < 0
            b = c
        else
            a = c
        end
        c = (a+b)/2
        error=(b-a)/2
        z = [z; a b c f(a) f(b) f(c) error]
    end
endfunction
