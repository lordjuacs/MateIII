clc
deff('y=f(x)','y=x.^2.*exp(x)')
x = [0:0.25:1]'
y = f(x)
M = [x^4 x^3 x^2 x ones(length(x),1)]
v = M\y
p = poly(v($:-1:1),'x','c')
dp = derivat(p)
disp(dp)
xi = [0 0.25 0.5 0.8 1 1.1 1.2]'
dpxi = horner(dp,xi)
disp(dpxi)
dfxi = diag(numderivative(f,xi))
disp(dfxi)
err = abs(dpxi-dfxi)
disp(err)
