// Función que calcula la distancia mínima
function min_index = minDistance(n, dist, sptSet)
        // Inicializa la distancia mínima en 'infinito',
        //usando el entero máximo
        min_ = 1000
        min_in = 0
        // Busca el nodo con la menor distancia
        for v = 1:n
            if (dist(v) < min_) & (sptSet(v) == %f) then
                min_ = dist(v)
                min_in = v
            end
        end
        min_index = min_in
endfunction
function [path, distances] = ddijkstra(self, src)
        [m, n] = size(self)
        dist = zeros(n,1)
        for node = 1:n
            dist(node,1) = 1000
        end
        nodes = zeros(n,1)
        for a = 1:n
            nodes(a,1) = a;
        end
        p = src
        sptSet = zeros(n, 1)
        dist(src) = 0
        sptSet(src) = 1
        
        for node = 1:m
            u = minDistance(n, dist, sptSet)
            sptSet(u) = 1
            for v = 1:n
                efe = dist(u,1) + self(u, v);
                if (sptSet(v,1) == 0) && (dist(v,1) > efe)then
                    dist(v,1) = efe
                    p = nodes(u,1);
                end
              end
        end
      path = p
      distances = dist
endfunction

function vec = dijkstra(matriz, src)
    matrix_M = floyd_warshall(matriz)
    vec = matrix_M(src, :)
endfunction


