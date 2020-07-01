function tabla = diferencias_divididas(x, y)
   n = length(x);
   dfd=zeros(n,n);
   dfd(:,1)=y;
   for j=2:n
      for i=j:n
         dfd(i,j)=(dfd(i,j-1)-dfd(i-1,j-1))/(x(i)-x(i-j+1))
      end
   end
   tabla = dfd
endfunction
