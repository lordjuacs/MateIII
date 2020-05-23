clc
N = 1
j = 1
d = zeros(1, 23)
while(j<23)
   d(j) = floor(N*2)
   N = N*2 - floor(N*2)
   j = j + 1 
    
end
disp(d)
