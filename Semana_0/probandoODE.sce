clc
deff("dy=f(x,y)", "dy=sqrt(y)/(2*x+1)");
x0 = 0;
y0 = 4;
x = 0 : 0.1 : 2;
y = ode(y0, x0, x, f);
plot(x, y, "*");
