clc
//para los 11 dias
y0 = [31.237385*10^6;6;0];
t= [1:11]
Infec_exac = [1;6;7;9;11;17;22;38;43;71;86]
y=ode(y0, 1, t, virus)
Infec_SIR=y(2,:)
disp([Infec_exac Infec_SIR'])
