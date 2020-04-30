//Proyección de un triángulo de R3 al plano XY
//A(3;0;3), B(1;-2;4), C(5;6;8)
clc
//primero y ultimo son el mismo
p1 = [3 1 5 3]
p2 = [0 -2 6 0]
p3 = [3 4 8 3]
P = [3 1 5 3; 0 -2 6 0; 3 4 8 3]
p1 = P(1,:)
p2 = P(2,:)
p3 = P(3,:)
param3d(p1,p2,p3)
//Proyección en el plano XY
M = [1 0 0; 0 1 0; 0 0 0]
P1 = M*P
p1 = P1(1,:)
p2 = P1(2,:)
p3 = P1(3,:)
param3d(p1,p2,p3)
xfpoly(p1,p2,6)
