function polinomio = interpolacion_lagrange(x, y)
   n = length(x)
   xi=poly(0,"x")
   P=0;
   for i=1:n
      L=1
      for j=[1:i-1,i+1:n]
         L=L(xi-x(j))/(x(i)-x(j))
      end
      P = P + Ly(i)
   end
   polinomio = P
endfunction
