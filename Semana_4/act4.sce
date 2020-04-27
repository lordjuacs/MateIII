//Actividad 4
//Origen --> O(0;0;0)
//P2 --> (-1;1;-1)
//R3 --> R3
//Rotación alrededor de la recta que pasa por O y P2
//P1(1;-1;-1) se convierte en P3(-1;-1;1)


clc
disp("MATE III - SEMANA 4")
disp("GRUPO 2")
disp("Actividad 4")

O = [0 0 0]'
P2 = [-1 1 -1]'
V = [P2(1)-O(1);P2(2)-O(2);P2(3)-O(3)]
Vuni = V/((sum(V.^2))^0.5)
disp(Vuni, "Vector unitario")

//Puntos a transformar
P1 = [1 -1 -1]'
P0 = [1 1 1]'
P2 = [-1 1 -1]'
P3 = [-1 -1 1]'
//Ángulo teta
angulo = (2*%pi/3)
//Matriz de coeficientes de la transformación
R = [cos(angulo)+(Vuni(1)^2)*(1-cos(angulo)), Vuni(1)*Vuni(2)*(1-cos(angulo))-Vuni(3)*sin(angulo), Vuni(1)*Vuni(3)*(1-cos(angulo))+Vuni(2)*sin(angulo); Vuni(2)*Vuni(1)*(1-cos(angulo))+Vuni(3)*sin(angulo),cos(angulo)+(Vuni(2)^2)*(1-cos(angulo)), Vuni(2)*Vuni(3)*(1-cos(angulo))-Vuni(1)*sin(angulo); Vuni(3)*Vuni(1)*(1-cos(angulo))-Vuni(2)*sin(angulo), Vuni(3)*Vuni(2)*(1-cos(angulo))+Vuni(1)*sin(angulo), cos(angulo)+(Vuni(3)^2)*(1-cos(angulo))]

disp(R, "Matriz de coeficientes")
disp(P0, "P0")
disp(R*P0, "P0 Transformado")
disp(P1, "P1")
disp(R*P1, "P1 Transformado")
disp(P2, "P2")
disp(R*P2, "P2 Transformado")
disp(P3, "P3")
disp(R*P3, "P3 Transformado")




