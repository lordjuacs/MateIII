clc
M = [-2 0 3; -23 -15 -18; -5 -3 -3]

X = [0 0 0]'
N = M*X
disp(N, "N1")

X = [12 -28 8]
N = M*X'
disp(N, "N2")

X = [1 -2 1]'
N = M*X
disp(N, "N3")

X = [3 -7 2]'
N = M*X
disp(N, "N4")

X = [2 -4 -4]'
N = M*X
disp(N, "N5")

X = [9 -18 -15]'
N = M*X
disp(N, "N6")
