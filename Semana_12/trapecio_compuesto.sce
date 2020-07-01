function I = trapecio_compuesto(f, a, b, h)
    x = [a:h:b]
    I = (h/2)(f(x(1))+2*sum(f(x(2:length(x)-1)))+f(b))
endfunction
