clf
x = [2 3 5]
y = [-1 2 -7]
N = length(x)
xx = (x(1):0.1:x(N))'
d = splin(x,y,"natural")
disp(d)
ys = interp(xx,x,y,d)
plot2d(xx,ys)
xgrid(10)

//Utilizando la funcion splinenatural
[S, poll] = splinenatural(x,y)
disp(S)
disp(poll)
