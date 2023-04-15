function [Adj] = get_adjacency_matrix(Labyrinth)
    % m si n preiau dimensiunile matricii Labyrinth
    [m, n] = size(Labyrinth);

    % N este numarul de celule din matrice fara Win si Loose(nr de noduri)
    N = m * n;

    % cream matricea rara de adiacenta Adj (labirint + Win & Loose)
    Adj = sparse(N + 2, N + 2);

    % din Win in Win
    Adj(N + 1, N + 1) = 1;

    % din Loose in Loose
    Adj(N + 2, N + 2) = 1;

    % parcurgem fiecare celula din labirint
    % marcam in matricea de adiacenta pozitiile in care poate sa ajunga robotul
    for i = 1:m
        for j = 1:n
            % retinem in k indicele nodului curent
            % in current valoarea din labirint convertind intr-o matrice densa
            k = (i-1)*n + j;
            current = full(Labyrinth(i, j));
            % verificam vecinii sus, jos, stanga, dreapta
            % bit = 0 inseamna ca nu avem zid
            %current

            % vecinul de sus
            bit = bitand(current, bitshift(1,3));

            % marcam pentru Win sus
            if i == 1 && bit == 0
              Adj(k, N + 1) = 1;
            endif

            % marcam pentru interior
            if in_matrix(m, n, i-1, j) ~= 0 && bit == 0
              k_top = (i-2)*n + j;
              Adj(k, k_top) = 1;
            endif


            % vecinul de jos
            bit = bitand(current, bitshift(1,2));

            % marcam pentru Win jos
            if i == m && bit == 0
              Adj(k, N + 1) = 1;
            endif

            % marcam pentru interior
            if in_matrix(m, n, i+1, j) ~= 0 && bit == 0
              k_bottom = i*n + j;
              Adj(k, k_bottom) = 1;
            endif


            % vecinul din dreapta
            bit = bitand(current, bitshift(1,1));

            % marcam pentru loose dreapta
            if j == n && bit == 0
              Adj(k, N + 2) = 1;
            endif

            % marcam pentru interior
            if in_matrix(m, n, i, j+1) ~= 0 && bit == 0
              k_right = (i-1)*n + j+1;
              Adj(k, k_right) = 1;
            endif


            % vecinul din stanga
            bit = bitand(current, bitshift(1,0));

            % marcam pentru loose stanga
            if j == 1 && bit == 0
              Adj(k, N + 2) = 1;
            endif

            % marcam pentru interior
            if in_matrix(m, n, i, j-1) ~= 0 && bit == 0
              k_left = (i-1)*n + j-1;
              Adj(k, k_left) = 1;
            endif

            %Adj
        endfor
    endfor
endfunction
