clc
function I = trapecio_compuesto_puntos(x, y)
    n = length(x)
    h = (x(n)-x(1))/(n-1)
   I = (h/2)*(y(1)+2*sum(y(2:n-1))+y(n))
endfunction
 
disp("MATEMÁTICAS III - CICLO 2020-1")
disp("Sección 1.01 - Profesor: Hermes Pantoja")
disp("Integrantes:")
disp("Mayra Díaz")
disp("Gino Camizán")
disp("José Porres")
disp("Joaquín Ramírez")
caudal=zeros(11,11)
diagSec=[28 31 30 31 30 31 31 30 31 30 31] //hi
main=[118 118 122 122 122 122 124 122 122 122 122] //2(hi+hi+1))
n=length(diagSec)
tc=[0.977142857 -0.806820276 12.50167742 -15.75329032 -1.974709677 2.253419355 0.867096774 -3.520516129 3.040516129 0.383483871 -0.21316129]              // 6*(f[]-f[])
ha = [2.0 2.1 2.3 2.4 3.0 2.9 2.7 2.6 2.5 2.3 2.2 2.1 2]
w = 8
v = [2.0 2.2 2.5 2.7 5 4.7 4.1 3.8 3.7 2.8 2.5 2.3 2]
ve = ha*w
ve = ve.*v
disp("PARTE I")
disp("Pregunta A")
disp(ve,"Caudal (m^3/s)")

h=[31 diagSec]  //h0-h11
fy=[0.16 0.322857143 0.188387097 2.272 -0.353548387 -0.682666667 -0.307096774 -0.162580645 -0.749333333 -0.242580645 -0.178666667 -0.214193548]
dia=[1 32 60 91 121 152 182 213 244 274 305 335 366]
da=dia
dia=dia'
for i=1:n
    for j=1:n
       if i==j
        caudal(i,j)=main(i) ; end
     if i==j+1
        caudal(i,j)=diagSec(i-1) ; end
      if i==j-1
       caudal(i,j)=diagSec(i)
       end 
    end
end


M=inv(caudal)*tc'
 dv=[0 M' 0]  // derivadas 0-11

a=[] ; b=[] ; c=[] ; d=[]; pol=[]
for i=1:12
    a(i)=(dv(i+1)-dv(i))/(6*h(i))
    b(i)=dv(i)/2
    c(i)=fy(i)-(dv(i+1)+2*dv(i))*h(i)/6
    d(i)= ve(i)
pol(i)= poly([d(i) c(i) b(i) a(i)], "x", "coeff")
end
p1=[];p2=[];p3=[];p4=[];p5=[];p6=[];p7=[];p8=[];p9=[];p10=[];p11=[];p12=[]

for i=1:366
    if (i<=32) then
        p1(i)=a(1)*(i-1)^3+c(1)*(i-1)+d(1)
    elseif (i>=32 & i<=60) 
    p2(i-31)=a(2)*(i-32)^3+b(2)*(i-32)^2+c(2)*(i-32)+d(2)
    elseif (i>=60 & i<=91) 
    p3(i-59)=a(3)*(i-60)^3+b(3)*(i-60)^2+c(3)*(i-60)+d(3)
    elseif (i>=91 & i<=121) 
    p4(i-90)=a(4)*(i-91)^3+b(4)*(i-91)^2+c(4)*(i-91)+d(4)
    elseif (i>=121 & i<=152) 
    p5(i-120)=a(5)*(i-121)^3+b(5)*(i-121)^2+c(5)*(i-121)+d(5)
    elseif (i>=152 & i<=182) 
    p6(i-151)=a(6)*(i-152)^3+b(6)*(i-152)^2+c(6)*(i-152)+d(6)
    elseif (i>=182 & i<=213) 
    p7(i-181)=a(7)*(i-182)^3+b(7)*(i-182)^2+c(7)*(i-182)+d(7)
    elseif (i>=213 & i<=244) 
    p8(i-212)=a(8)*(i-213)^3+b(8)*(i-213)^2+c(8)*(i-213)+d(8)
    elseif (i>=244 & i<=274) 
    p9(i-243)=a(9)*(i-244)^3+b(9)*(i-244)^2+c(9)*(i-244)+d(9)
    elseif (i>=274 & i<=305) 
    p10(i-273)=a(10)*(i-274)^3+b(10)*(i-274)^2+c(10)*(i-274)+d(10)
    elseif (i>=305 & i<=335) 
    p11(i-304)=a(11)*(i-305)^3+b(11)*(i-305)^2+c(11)*(i-305)+d(11)
    elseif (i>=335 & i<=366) 
    p12(i-334)=a(12)*(i-335)^3+b(12)*(i-335)^2+c(12)*(i-335)+d(12)
    else p1=0;            
    end
end
//disp("M",M)
//disp('a',a,'b',b,'c',c,'d',d)
mxl=[]
mxl=[dia(1:12,:) pol]
p2=[p2;0;0;0];p4=[p4;0];p6=[p6;0];p9=[p9;0];p11=[p11;0]   //lenght 32
//disp('s0 - s11',mxl) // matrix de polinomio
matrixl=zeros(32,12)
matrixl=[p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12]
disp("PREGUNTA B")
disp("Caudal anual - Spline Cúbico Natural")
disp(sum(matrixl)*60*60*24) // caudal total
trap = trapecio_compuesto_puntos(dia,ve)
trap = trap*60*60*24
disp("Caudal anual - Trapecio Compuesto")
disp(trap)
// grafico
disp("PREGUNTA C (ver gráfica)")
plot (da,ve)
gca().grid=[1 1 1]
xlabel('Dia')
ylabel('Caudal (m3/s)')
title("Pregunta C - Caudal")
 
disp("PARTE II")

disp("PREGUNTA A")
fase=[-120 -110 -80 -40 -10 30 80 110 120] 
magnitud= [7.92 7.98 8.95 10.71 11.7 10.01 8.23 7.86 7.92]
h=[] ;fy=[] ;B=[] ; dl=[]
n=length(fase)
for i=1:n-1
    h(i)=fase(i+1)-fase(i)
    fy(i)=(magnitud(i+1)-magnitud(i))/h(i)
end
for i=1:n
if i<9 & i>1 then 
    dl(i)=2*(h(i)+h(i-1))
    B(i)=6*(fy(i)-fy(i-1))
elseif i==1
    dl(i)=2*(h(i))
    B(i)=6*fy(i)
elseif i==9
    dl(i)=2*(h(i-1))
    B(i)=6*fy(i-1)
end 
end 
mt=zeros(n,n)
for i=1:n
    for j=1:n
       if i==j
        mt(i,j)=dl(i) ; end
     if i==j+1
        mt(i,j)=h(i-1) ; end
      if i==j-1
       mt(i,j)=h(i)
       end 
    end
end
disp(mt)
M=inv(mt)*B //derivadas
a=[] ; b=[] ; c=[] ; d=[]; pol=[]
for i=1:n-1
    a(i)=(M(i+1)-M(i))/(6*h(i))
    b(i)=M(i)/2
    c(i)=fy(i)-(M(i+1)+2*M(i))*h(i)/6
    d(i)= magnitud(i)
pol(i)= poly([d(i) c(i) b(i) a(i)], "x", "coeff")
end
fase=fase'
mxl=[fase(1:n-1,:) pol]
disp("PREGUNTA B")
disp(mxl)
fn = []
deff('y=F1(x)','y=7.92 +0.0004355*(x+120)^2 +0.0000165*(x+120)^3')  
x=-120
res=F1(x)
fn(1) = res
disp('-120',res)

deff('y=F2(x)','y=7.98+0.0136453*(x+110) +0.0009291*(x+110)^2 -0.0000102*(x+110)^3')
 x=-110
 res=F2(x)
fn(2) = res
disp('-110',res)

deff('y=F3(x)','y=8.95 +0.0418377*(x+80) +0.0000107*(x+80)^2  +0.0000011*(x+80)^3') 
x=-80 
res=F3(x)
fn(3) = res
disp('-80',res)

deff('y=F4(x)','y=10.71+0.0478971*(x+40) +0.0001408*(x+40)^2 -0.0000212*(x+40)^3') 
x=-40 
 res=F4(x)
 fn(4) = res
disp('-40',res)

deff('y=F5(x)','y=11.7-0.0010182*(x+10) -0.0017713*(x+10)^2 +0.0000185*(x+10)^3')  
x=-10 
 res=F5(x)
 fn(5) = res
disp('-10',res)
deff('y=F6(x)','y=10.01-0.0538611*(x-30) +0.0004502*(x-30)^2 -0.0000017*(x-30)^3')
x=30
res=F6(x)
fn(6) = res
disp('30',res)

deff('y=F7(x)','y=8.23 -0.0215897*(x-80) +0.0001952*(x-80)^2  +0.0000038*(x-80)^3')
x=80
res=F7(x)
fn(7) = res
disp('80',res)

deff('y=F8(x)','y= 7.86 +0.0003237*(x-110) +0.0005353*(x-110)^2  +0.0000032*(x-110)^3')
x=110
res=F8(x)
fn(8) = res
disp('110',res)
x=120
res=F8(x)
fn(9) = res
disp('120',res)

scf(1)
plot(fase,fn)
leg=legend(['Periodic Spline'])
xlabel('Fase (ø)') ; ylabel('Magnitud')
title("Pregunta C - Osa Mayor")
gca().grid=[1 1 1]


//
fn2 = []
disp("PREGUNTA C")
x=-100
res=F1(x)
fn2(1) = res
disp('-100',res)
x=-60
res=F3(x)
fn2(2) = res
disp('-60',res)
x=-20
res=F4(x)
fn2(3) = res
disp('-20',res)
x=20
res=F5(x)
fn2(4) = res
disp('20',res)
x=60
res=F6(x)
fn2(5) = res
disp('60',res)
x=100
res=F7(x)
fn2(6) = res
disp('100',res)
scf(2)
col1=[-100 -60 -20 -20 60 100]
f1=[8.37 9.40 11.39 10.84 8.53 7.89]
error = abs(f1'-fn2)
disp("M        Real    Approx      Error")
fn2=[col1' f1' fn2 error]
disp(fn2)
disp("PREGUNTA D (ver la gráfica)")
plot(fn2(:,1),fn2(:,2),'b',fn2(:,1),fn2(:,3),'r') ; xlabel('Fase (ø)') ; ylabel('Magnitud')
leg=legend(['Real points';'Periodic Spline']);
title("Pregunta D - Osa Mayor")
gca().grid=[1 1 1]

disp("PARTE III")
 
 function [z] = rk2(f, a, b, y0, h)
   z = [a y0]
	x = [a:h:b]
	n = length(x)
	for k = 1:n-1
		k1 = h*f(x(k), y0)
		k2 = h*f(x(k+1), y0+k1)
		y1 = y0 + 0.5*(k1+k2)
		z = [z; x(k+1) y1]
		y0 = y1
	end
endfunction

function z = rk4(f, a, b, y0, h)
   z = [a y0]
	x = [a:h:b]
	n = length(x)
   for k = 1:n-1
		k1 = h*f(x(k), y0)
		k2 = h*f(x(k)+h/2, y0+k1/2)
      k3 = h*f(x(k)+h/2, y0+k2/2)
      k4 = h*f(x(k)+h, y0+k3)
      y1 = y0 + (1/6)*(k1+2*(k2+k3)+k4)
		z = [z; x(k+1) y1]
		y0 = y1
	end
endfunction

deff('d=g(t, h)', 'd=(300+1000*sin(5*%pi*t/12)*cos(%pi*t/12)-60*sqrt(19.62*h))/3130')

function ydot = f(t, h)
	ydot = (300+1000*sin(5*%pi*t/12)*cos(%pi*t/12)-60*sqrt(19.62*h))/3130
endfunction

t = [0:0.1:150]
v = ode(3, 0, t, f)
vf = v'
r2 = rk2(g, 0, 150, 3, 0.1)
r4 = rk4(g, 0, 150, 3, 0.1)

dif2 = abs(vf- r2(:,2))
dif4 = abs(vf- r4(:,2))

todo2 = [r2(:,2) vf dif2]
todo4 = [r4(:,2) vf dif4]
disp("PREGUNTA A y B")
disp("Resultados de RK2 - ODE - Error por Punto")
disp('   RK2      ODE 	  ERROR', todo2)
disp("Resultados de RK4 - ODE - Error por Punto")
disp('   RK4      ODE 	  ERROR', todo4)
disp("Comparación de Errores")
disp(sum(dif2)/length(dif2), "Error promedio dif RK2")
disp(sum(dif4)/length(dif4), "Error promedio dif RK4")
scf(4)
plot(t, r2(:,2),'b',t, r4(:,2),'r',t, vf,'g')
leg=legend(['RK2';'RK4';'ODE']);
xlabel('Tiempo (s)') ; ylabel('Altura (m)')
title("Tanque de Agua (hacer zoom)")
gca().grid=[1 1 1]
////scf(4)
//plot(t, r4(:,2),'r')
//xlabel('Tiempo (s)') ; ylabel('Altura (m)')
//title("Runge-Kutta 4")
//gca().grid=[1 1 1]
////scf(5)
//plot(t, vf,'g')
//xlabel('Tiempo (s)') ; ylabel('Altura (m)')
//gca().grid=[1 1 1]
//title("ODE")
//



