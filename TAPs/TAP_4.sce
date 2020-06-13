clc
disp("MATEMÁTICAS III - SECCIÓN 1.01")
disp("INTEGRANTES:")
disp("MAYRA DÍAZ")
disp("JOSÉ PORRES")
disp("GINO CAMIZÁN")
disp("JOAQUÍN RAMÍREZ")
disp("PARTE I")
disp("Pregunta A")
disp("g1(c) = c - ((10-c)/2.5)^2")
disp("g1(2) = -8.24  g1(6) = 3.44 ---> g1(2)*g1(6) < 1 --> Verdadero")
disp("g2(c) = c - 10 + 2.5*sqrt(c)")
disp("g2(2) = -4.64  g2(6) = 2.124 ---> g2(2)*g2(6) < 1 --> Verdadero")
disp("Pregunta B")
disp(floor(log2(2000)),"Mínimo n teraciones - Tol = 10^-3")

disp("Pregunta C")
disp("g1''(c) = -3.2 + 0.32*c")
disp("|g1(2)| = 2.56 > 1")
disp("|g1(6)| = 1.28 > 1")
disp("No converge")
disp("g2''(c) = -1.25/sqrt(c)")
disp("|g2(2)| = 0.884 < 1")
disp("|g2(6)| = 0.510 < 1")
disp("Sí converge")
disp("Pregunta D")
deff('y=g(x)', 'y= 10-2.5*sqrt(x)')

err = 1
x = 5.53
z = [x err]
for i = 1:10
  xprev = x
  x = g(x)
  err = abs((x-xprev)/x)
  z = [z; x err]
end
disp(z,"Punto Fijo      Error")
disp(z(11,1) ,"Punto Fijo - Iteración 10")
disp(z(11,2) ,"Error - Iteración 10")






disp("PARTE II")
disp("Pregunta A")
disp("Mínimos cuadrados")
x = [0.889, 1.085, 1.041, 1.397, 1.27, 0.94]'
y = [14.6, 16.7, 15.3, 23.2, 19.5, 16.1]'
tabla = [x y]
xy = []
for i=1:6
    pro = tabla(i,1)*tabla(i,2)
    xy = [xy; pro]
end
tabla = [tabla xy]
xcua = []
for i=1:6
    x2 = tabla(i,1)*tabla(i,1)
    xcua = [xcua; x2]
end
tabla = [tabla xcua]
tabla2 = [tabla; sum(tabla(:,1)) sum(tabla(:,2)) sum(tabla(:,3)) sum(tabla(:,4))]
xprom = sum(tabla(:,1))/6
yprom = sum(tabla(:,2))/6
disp(tabla)
disp(xprom, "xprom")
disp(yprom, "yprom")
a1 = (6*tabla2(7,3) - tabla2(7,1)*tabla2(7,2))/(6*tabla2(7,4) - tabla2(7,1)*tabla2(7,1))
a0 = yprom - a1*xprom
disp(a1, "a1")
disp(a0, "a0")




disp("Pregunta B")
A=[0.889 1; 1.085 1; 1.041 1; 1.397 1; 1.27 1; 0.94 1]
y =[14.6 16.7 15.3 23.2 19.5 16.1]'
[Q R] = qr(A)
R = R(1:2,:)
Q = Q(:,1:2)
disp(Q, "Q")
disp(R, "R")
c = inv(R)*Q'*y
disp("QR")
disp(c, "a1; a0")
disp("Pregunta C")
x0=1.2
flucua = 1.2*a1 + a0
fluqr = 1.2*c(1) + c(2)
disp("Flujo - Precipitación 120 cm")
disp(flucua, "Por mínimos cuadrados")
disp(fluqr, "Por QR")
deff('y=f(x)', 'y=a0+a1*x')
xx=[0:0.001:2]
yy = f(xx)
plot(xx,yy,'r')
xgrid(10)
disp("Pregunta D")


