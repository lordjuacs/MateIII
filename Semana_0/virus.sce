//x es un vector [ Sus, Inf, Rec]
function dxdt=virus(t, x)
dxdt = zeros(3, 1);
b = 0.415;
N = x(1) + x(2) + x(3);
g = 0.15;
dxdt(1) = -b*x(2)*x(1)/N;
dxdt(2) = b*x(2)*x(1)/N-g*x(2);
dxdt(3) = g*x(2);
end
