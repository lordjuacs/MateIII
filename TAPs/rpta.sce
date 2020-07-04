
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

