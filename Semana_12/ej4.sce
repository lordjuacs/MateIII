clc
deff('y=f1(x)', 'y=exp(x).*(x^2+2*x)')
h = 1
Ie = intg(0,1,f1)
disp(Ie)
Ia = (h/2)*(f1(0)+f1(1))
disp(Ia)
err = abs(Ie-Ia)
disp(err)
h = 1/2
Ia2 = (h/2)*(f1(0)+2*f1(0.5)+f1(1))
disp(Ia2)
err = abs(Ie-Ia2)
disp(err)
//Simpson 1/3
h = 0.5
Isimp = h/3*(f1(0)+4*f1(0.5)+f1(1))

