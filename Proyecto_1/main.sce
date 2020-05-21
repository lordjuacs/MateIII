precioM = [0, 34, 42, 47, 45;
          40, 0, 34, 0, 0;
          33, 60, 0, 0, 0;
          44, 0, 0, 0, 0;
          42, 0, 0, 0, 0]

precioN = [0, 37, 40, 30, 39;
          30, 0, 34, 0, 0;
          24, 36, 0, 0, 0;
          33, 0, 0, 0, 0;
          63, 0, 0, 0, 0]

tiempo = [0, 1.333, 1.5, 1.666, 1.75;
          1.333, 0, 1, 0, 0;
          1.5, 1, 0, 0, 0;
          1.666, 0, 0, 0, 0;
          1.75, 0, 0, 0, 0]


// Dimensión de la matriz
[m, n] = size(precioN)

// Rellena la matriz con los datos ingresados a partir
// de la relación 0,3*tiempo + 0,7*precio
for k = 1: n
  for m = 1: n
    noche(k, m) = 0.7*precioN(k, m) + 0.3*tiempo(k, m)
    manana(k, m) = 0.7*precioM(k, m) + 0.3*tiempo(k, m)
  end
end

disp(noche, "MATRIZ ADYACENCIA DE NOCHE:")
disp(manana, "MATRIZ ADYACENCIA DE  MAÑANA")

//Nombres para impresión
nombres = ["Lima"; "Cusco"; "Arequipa"; "Piura"; "Iquitos"]


//Ejecución Floyd Warshall
disp("---------- Floyd Warshall ----------")
disp("VUELOS DE NOCHE")
disp("----------------")
matrix_N = floyd_warshall(noche)
disp(matrix_N, "Matriz de indicadores:")
    

disp("VUELOS DE DÍA")
disp("----------------")
matrix_M = floyd_warshall(manana)
disp(matrix_M, "Matriz de indicadores:")

//Ejecución Dijkstra
disp("---------- DIJKSTRA ----------")
disp("VUELOS DE NOCHE")
disp("----------------")
        
for i = 1: n
    disp(nombres(i))
    vec = dijkstra(noche,i)
    disp(vec)
end

disp("VUELOS DE DÍA")
disp("----------------")
for i = 1:n
    disp(nombres(i))
    vec = dijkstra(manana, i)
    disp(vec)
end


