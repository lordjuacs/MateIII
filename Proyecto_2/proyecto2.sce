function I = simpson(x,y)
    h = (x(3)- x(1))/2
    I = (h/3)*(y(1)+4*y(2) + y(3))
endfunction
function polinomio = minimos_cuadrados(x, y, grado)
   n = length(y)
   A = ones(grado+1, grado+1)
   b = ones(grado+1, 1)
   A(1,1) = n
   b(1) = sum(y)
   for i = 2:grado+1
      A(1, i) = sum(x^(i-1))
   end
   for i = 2:grado+1
      gr = i-1
      for j = 1:grado+1
         A(i, j) = sum(x^(gr))
         gr = gr + 1
      end
      b(i) = sum((x^(i-1)).*y)
   end
   disp(A)
   disp(sum(A))
   coeficientes = inv(A)*b
   polinomio = poly(coeficientes, 'x', 'c')

   // ERROR
   //yprom = sum(y)/
endfunction

clc
//22 psi
conv_psi = 6894.76

x_long = [10 11 13.4 14.2 14.7 15.3]'/100
x_long_2 = x_long/2
x = [zeros(length(x_long),1)  x_long_2 x_long]
disp(x,"x")
y_ex = [3 3.8 4 4.2 4.3 4.4]'/100
y_med = [4.4 4.6 4.9 5.1 5.2 5.4]'/100
y = [y_ex y_med y_ex]/2
disp(y,"y")
area22 = zeros(length(x_long),1)
for i=1:length(x_long)
    x_i = x(i,:)
    y_i = y(i,:)
    area22(i) =  simpson(x_i,y_i)*2
end
disp(area22, "area22")
fuerza22 = (45*conv_psi*area22)
disp(fuerza22, "fuerza22")
pol22 = minimos_cuadrados(area22, fuerza22, 1)
prueba1 = [0:0.0001:0.007]
disp(pol22)

//21 psi
x_long_2 = [9 10.2 12.3 13.7 14.3 14.9]'/100
x_long_2_2 = x_long_2/2
x_2 = [zeros(length(x_long_2),1)  x_long_2 x_long_2]
disp(x,"x")
y_ex_2 = [2.8 3.4 3.9 4 4.2 4.3]'/100
y_med_2 = [4 4.2 4.4 4.8 5 5.2]'/100
y_2 = [y_ex_2 y_med_2 y_ex_2]/2
disp(y,"y")
area21 = zeros(length(x_long_2),1)
for i=1:length(x_long_2)
    x_i = x_2(i,:)
    y_i = y_2(i,:)
    area21(i) =  simpson(x_i,y_i)*2
end
disp(area21, "area21")
fuerza21 = (44*conv_psi*area21)
disp(fuerza21, "fuerza21")
pol21 = minimos_cuadrados(area21, fuerza21, 1)
prueba2 = [0:0.0001:0.007]
disp(pol22)
//20 psi
x_long_3 = [8.5 9.6 11.4 12.8 13.7 14.3]'/100
x_long_2_3 = x_long_3/2
x_3 = [zeros(length(x_long_3),1)  x_long_3 x_long_3]
disp(x_3,"x")
y_ex_3 = [2.5 3.4 3.7 4 4.1 4.3]'/100
y_med_3 = [3.8 4 4.2 4.4 4.7 5]'/100
y_3 = [y_ex_3 y_med_3 y_ex_3]/2
disp(y,"y")
area20 = zeros(length(x_long_3),1)
for i=1:length(x_long_3)
    x_i = x_3(i,:)
    y_i = y_3(i,:)
    area20(i) =  simpson(x_i,y_i)*2
end
disp(area20, "area20")
fuerza20 = (20*conv_psi*area20)
disp(fuerza20, "fuerza20")
pol20 = minimos_cuadrados(area20, fuerza20, 1)
prueba3 = [0:0.0001:0.007]
disp(pol20)

plot(prueba1,horner(pol22,prueba1), 'b')
leg=legend(['Presión 22 PSI'])
xlabel('Área (m2)') ; ylabel('Fuerza (N)')
gca().grid=[1 1 1]
scf(2)
plot(prueba2,horner(pol21,prueba2),'r')

leg = legend(['Presión 21 PSI'])
xlabel('Área (m2)') ; ylabel('Fuerza (N)')
gca().grid=[1 1 1]
scf(3)
plot(prueba3,horner(pol20,prueba3), 'g')

leg = legend(['Presión 20 PSI'])
xlabel('Área (m2)') ; ylabel('Fuerza (N)')
title("Área vs Fuerza")
gca().grid=[1 1 1]



