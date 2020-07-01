function polinomio = interpolacion_polinomial(x, y)
   n = length(x)
   M = ones(n, 1)
   M = [M x]
   for i = 3:n
      aux = x(:)^(i-1)
      M = [M aux]
   end
   coeficientes = inv(M)*y
   polinomio = poly(coeficientes, 'x', 'c')
endfunction
