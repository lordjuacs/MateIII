clc

deff('y=f(x)','y=x^2.*exp(x)')
x = 1
h = 0.1
dfa = (f(x+h)-f(x))/h
disp(dfa)
dfe = numderivative(f,x)
disp(dfe)
err = abs(dfa-dfe)
disp(err)
