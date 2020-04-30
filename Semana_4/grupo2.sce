clc
clf()
clf()
// O(0 0 0)', A(3 0 0)', B(3 0 1)', C(0 0 1)'
//Cara 1
A1 = [0 3 3 0 0; 0 0 0 0 0; 0 0 1 1 0]
x1 = A1(1,:)
y1 = A1(2,:)
z1 = A1(3,:)
param3d(x1,y1,z1)
plot3d(A1(1,1:4)',A1(2,1:4)',A1(3,1:4)')

//Cara 3
//F(3 2 0)' A(3 0 0)' B(3 0 1)' G(3 2 1)'
A3 = [3 3 3 3 3; 2 0 0 2 2; 0 0 1 1 0]
x3 = A3(1,:)
y3 = A3(2,:)
z3 = A3(3,:)
param3d(x3,y3,z3)
plot3d(A3(1,1:4)',A3(2,1:4)',A3(3,1:4)')
//Cara 2
//E(0 2 0)' F(3 2 0)' G(3 2 1)' D(0 2 1)'
A2 = [0 3 3 0 0; 2 2 2 2 2; 0 0 1 1 0]
x2 = A2(1,:)
y2 = A2(2,:)
z2 = A2(3,:)
param3d(x2,y2,z2)
plot3d(A2(1,1:4)',A2(2,1:4)',A2(3,1:4)')
//Cara 4
//O(0 0 0)' C(0 0 1)' D(0 2 1)' E(0 2 0)'
A4 = [0 0 0 0 0; 0 0 2 2 0; 0 1 1 0 0]
x4 = A4(1,:)
y4 = A4(2,:)
z4 = A4(3,:)
param3d(x4,y4,z4)
plot3d(A4(1,1:4)',A4(2,1:4)',A4(3,1:4)')
//Cara 5
//O(0 0 0)' A(3 0 0)' F(3 2 0)' E(0 2 0)'
A5 = [0 3 3 0 0; 0 0 2 2 0; 0 0 0 0 0]
x5 = A5(1,:)
y5 = A5(2,:)
z5 = A5(3,:)
param3d(x5,y5,z5)
plot3d(A5(1,1:4)',A5(2,1:4)',A5(3,1:4)')
//Cara 6
//C(0 0 1)' D(0 2 1)' G(3 2 1)' B(3 0 1)'
A6 = [0 0 3 3 0; 0 2 2 0 0; 1 1 1 1 1]
x6 = A6(1,:)
y6 = A6(2,:)
z6 = A6(3,:)
param3d(x6,y6,z6)
plot3d(A6(1,1:4)',A6(2,1:4)',A6(3,1:4)')

Mxy = [1 0 0; 0 1 0; 0 0 0]
Mzx = [1 0 0; 0 0 0; 0 0 1]
Mzy = [0 0 0; 0 1 0; 0 0 1]

//A(2 1 1)', B(..,1,...)
alpha1 = 30*(%pi/180);
compxb = 2-2*cos(alpha1)
compzb = 1+2*sin(alpha1)
AB = [2 compxb; 1 1; 1 compzb]
xab = AB(1,:)
yab = AB(2,:)
zab = AB(3,:)
param3d(xab,yab,zab)
//A(2 1 1)', C(..,1,...)
alpha2 = 60*(%pi/180);
compxc = 2+4*sin(alpha2)*cos(alpha2)
compzc = 1+4*sin(alpha2)*sin(alpha2)
BC = [compxb compxc; 1 1; compzb compzc]
xbc = BC(1,:)
ybc = BC(2,:)
zbc = BC(3,:)
param3d(xbc,ybc,zbc)
//A(2 1 1)', D(..,1,...)
alpha3 = 60*(%pi/180);
compxd = 2 -4*sin(alpha3)*cos(alpha3)
compzd = 1+2 +4*sin(alpha2)*sin(alpha3)
CD = [compxc compxd ; 1 1; compzc compzd]
xcd = CD(1,:)
ycd = CD(2,:)
zcd = CD(3,:)
param3d(xcd,ycd,zcd)
//A(2 1 1)', E(..,1,...)
alpha4 = 90*(%pi/180);
compxe = 1-sqrt(3)
compze = 6 -sqrt(3)
DE = [compxd compxe ; 1 1; compzd compze]
xde = DE(1,:)
yde = DE(2,:)
zde = DE(3,:)
param3d(xde,yde,zde)

