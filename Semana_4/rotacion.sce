function XYZ = rotacion(ang1, xyz)
    ang1 = ang1/180*%pi
    c = cos(ang1)
    s = sin(ang1)
    
    Rx = [1 0 0; 0 c -s; 0 s c]
    Rz = [c -s 0; s c 0; 0 0 1]
    
    
    
    
    
    
    
    XYZ = Rz*xyz
endfunction
