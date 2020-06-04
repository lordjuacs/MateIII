clc
//Localizar una raíz gráficamente y=x^2+5*x+2*e^x
//Igualando y = 0
//f1(x)=x^2+5x
//f2(x)=-2e^x
deff('y=f1(x)','y=x.^2+5*x')
deff('y=f2(x)','y=-2*exp(x)')
xx = [-5:0.01:5]
yy1 = f1(xx)
yy2 = f2(xx)
plot(xx,yy1,'r',xx,yy2,'b')
xgrid(10)
deff('y=f(x)','y=x^2+5*x+2*exp(x)')
disp(f(-1))
disp(f(0))
z = biseccion(f,-1,0, 5)
disp(z)
z = biseccion2(f,-1,0, 1e-3)
disp(z)
