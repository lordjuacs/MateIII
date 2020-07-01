//Derivacion Numerica
clc
x = [0 0.1 0.2 0.4 0.5 0.55]'
y = [1.12 1.28 1.55 1.88 1.77 1.66]'
M = [x^5 x^4 x^3 x^2 x ones(length(x),1)]
v = M\y
p = poly(v($:-1:1), 'x', 'c')
disp(p)
dp = derivat(p)
disp(dp)
xi = [0 0.25 0.5]//Evaluara p'(0), p'(0.25), p'(0.5)
dpxi = horner(dp, xi)
disp(dpxi)
