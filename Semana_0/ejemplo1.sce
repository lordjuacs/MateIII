//Ecuaciones diferenciales ordinarias
//y'=f(t,y) -> dy/dt =es una funcion de y y del tiempo, por eso f(t,y)
//y(0)=y0   valor inicial
//PVI
//y'=-y+t+1=f(t,y)
//y(0)=1
//y(1)=??
deff('z=f(t,y)','z=-y+t+1')
tiempo =[0:0.1:1]
//para hallar la solucion para y en cualquier t:
//y = ode(valor de y inicial, tiempo inicial, tiempo en el q se evaluará, la funcion (//o sea a q es igual dy/dt)
y = ode(1,0,tiempo,f)
disp(y')
plot(tiempo,y,'r')
//rspsta exacta:y=exp(-t)+t
deff('u=g(t)','u=exp(-t)+t')
disp(g(tiempo), 'b')

