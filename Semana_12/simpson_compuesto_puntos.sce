function I = simpson_compuesto_puntos(x, y)
    n = length(x)   
    if modulo(n, 2) <> 0 then
        h = (x(n)-x(1))/(n-1)
       ypar = y(2:2:n-1)
      yimpar = y(3:2:n-2)
      I = (h/3)*(y(1)+4*sum(ypar)+2*sum(yimpar)+y(n))
   else
      disp('n debe ser impar')
      I = 0
    end
endfunction
