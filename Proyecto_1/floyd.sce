function M = floyd_warshall(graph)
    INF = 1000
    [m, nV] = size(graph)
    for k = 1:nV
        for i = 1:nV
            if (k <> i) & graph(k, i)== 0 then
              graph(k, i) = INF
            end
        end
    end
    
    dist = zeros(nV, nV)
    for i = 1: nV
      for j  = 1: nV
        dist(i, j) = graph(i, j)
      end
    end
    for k  = 1: nV
        for i  = 1: nV
            for j  = 1: nV
                vec = [dist(i, j); dist(i, k) + dist(k, j)]
                [po, va] = min(vec)
                dist(i, j) = po
            end
        end
    end 
    M = dist
endfunction
