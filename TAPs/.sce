t = %pi/6
Rx = [1 0 0; 0 cos(t) -sin(t); 0 sin(t) cos(t)]
w = [-2 2 4]'
y = Rx*w
disp(y)
