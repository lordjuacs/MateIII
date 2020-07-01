function polinomio = interpolacion_newton(x, y)
   n = length(x)
   dfd = diferencias_divididas(x, y)
   P = dfd(1,1);
   for i=2:n
      P = P + dfd(i,i) * poly (x(1:(i-1)), "x");
   end
   polinomio = P
endfunction
