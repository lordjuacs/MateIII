function I = trapecio_compuesto_puntos(x, y)
    n = length(x)
    h = (x(n)-x(1))/(n-1)
   I = (h/2)(y(1)+2*sum(y(2:n-1))+y(n))
endfunction
