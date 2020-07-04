function I = simpson_compuesto(f, a, b, n)
	if modulo(n, 2) == 0 then
        h = (b-a)/n
        x = [a:h:b]
        l = length(x)
        xpar = x(2:2:l-1)
        ximpar = x(3:2:l-2)
        fp = 0
        fi = 0
        for i = 1:length(xpar)
        fp = fp + f(xpar(i))
        end
        for i = 1:length(ximpar)
        fi = fi + f(ximpar(i))
        end
        I = (h/3)*(f(a)+4*fp+2*fi+f(b))
		// No siempre funciona
		//I = (h/3)*(f(a)+4*sum(f(xpar))+2*sum(f(ximpar))+f(b))
	else
		disp('n debe ser par')
		I = 0
	end
endfunction
