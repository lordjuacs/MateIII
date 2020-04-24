clc
theta1 = pi/4
theta2 = pi/3
L1 = 30
L2 = 20
pi = %pi
x = L1*cos(theta1)+L2*cos(theta1+theta2)
y= L1*sin(theta1) + L2*sin(theta1+theta2)
disp(x, "x")
disp(y, "y")

a_x = 90
a_y = 90
a_z = 90
matriz_rotacion_x = [1 0 0; 0 cos(a_x) -sin(a_x); 0 sin(a_x) cos(a_x)]
matriz_rotacion_y = [cos(a_y) 0 sin(a_y); 0 1 0; 0 -sin(a_y) cos(a_y)]
matriz_rotacion_z = [cos(a_z) -sin(a_z) 0; sin(a_z) cos(a_z) 0; 0 0 1]
