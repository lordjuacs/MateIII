function [D]=TablaDifDiv(x, y)
n=length(x);
D=zeros(n);
D(1:n,1)=y';
for j=2:n
    for i=1:n-j+1
        D(i,j)=(D(i,j-1)-D(i+1,j-1))/(x(i)-x(i+j-1));
    end
end
endfunction


