 function [z] = rk2(f, a, b, y0, h)
   z = [a y0]
	x = [a:h:b]
	n = length(x)
	for k = 1:n-1
		k1 = h*f(x(k), y0)
		k2 = h*f(x(k+1), y0+k1)
		y1 = y0 + 0.5*(k1+k2)
		z = [z; x(k+1) y1]
		y0 = y1
	end
endfunction
