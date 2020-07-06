function z = rk4(f, a, b, y0, h)
   z = [a y0]
	x = [a:h:b]
	n = length(x)
   for k = 1:n-1
		k1 = h*f(x(k), y0)
		k2 = h*f(x(k)+h/2, y0+k1/2)
      k3 = h*f(x(k)+h/2, y0+k2/2)
      k4 = h*f(x(k)+h, y0+k3)
      y1 = y0 + (1/6)*(k1+2*(k2+k3)+k4)
		z = [z; x(k+1) y1]
		y0 = y1
	end
endfunction
