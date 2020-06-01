clc
A = [1 0 1; 1/2 sqrt(3)/2 1; -1/2 sqrt(3)/2 1; 1 0 1; -1/2 -sqrt(3)/2 1; 1/2 -sqrt(3)/2 1]
y = [1 1.6 1.4 0.6 0.2 0.8]'
disp(A, "A")
disp(y, "y")
[Q R] = qr(A)
R = R(1:3,:)
Q = Q(:,1:3)
disp(Q, "Q")
disp(R, "R")
c = inv(R)*Q'*y
disp(c,"c")
