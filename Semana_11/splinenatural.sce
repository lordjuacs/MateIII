function [S, poll]=splinenatural(x, y)
n = length(x)-1;
poll = zeros(n-1,1)
h = diff(x); dd = diff(y)./h;
diagsupinf = h(2:n -1);
diagprinc = 2*(h(1:n -1) + h(2:n ));
M0=0; Mn =0;
if n > 2 then
    H = diag(diagprinc) + diag(diagsupinf,1) + diag(diagsupinf,-1);
else
    H = diag(diagprinc)
end
dy =6*diff(dd') ;// Matriz de diferencias divididas
M = H\dy ;
M =[M0 M' Mn];
disp(M)
// plot (x,y, ’or ’) // Activar para visualizar los puntos
for i =1:n
    S(i,1) =(M(i+1) - M(i))/(6*h(i)) ;
    S(i,2) = M(i)/2;
    S(i,3) = dd(i) - h(i)*(M(i+1) + 2* M(i))/6;
    S(i,4) = y(i) ; 
    pol = S(i,:) ;
    pol = poly(pol($:-1:1) ,'x','coeff');
    xx = linspace(x(i),x(i+1),100)-x(i)';
    z = poly (0,'z');
    poll(i) = horner(pol,z - x(i));
    yy = horner(pol,xx) ;
    plot(xx + x(i),yy,'b-');
    z = poly (0,'z');
end
endfunction
