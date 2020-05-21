function npoint = rotar_x(ang, point)
    ang = ang/180*%pi
    c = cos(ang)
    s = sin(ang)

    rx = [1 0 0; 0 c -s; 0 s c]
    npoint = rx*point
endfunction

function npoint = rotar_y(ang, point)
    ang = ang/180*%pi
    c = cos(ang)
    s = sin(ang)

    ry = [c 0 s; 0 1 0; -s 0 c]
    npoint = ry*point
endfunction


function npoint = rotar_z(ang, point)
    ang = ang/180*%pi
    c = cos(ang)
    s = sin(ang)

    rz = [c -s 0; s c 0; 0 0 1]
    npoint = rz*point
endfunction
