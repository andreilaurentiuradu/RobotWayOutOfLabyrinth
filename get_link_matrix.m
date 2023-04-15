function [Link] = get_link_matrix(Labyrinth)
  [m, n] = size(Labyrinth);

    % N este numarul de celule din matrice fara Win si Loose(nr de noduri)
    N = m * n;

    % cream matricea rara de adiacenta Link (probabilitati)
    Link = sparse(N + 2, N + 2);

    % din Win in Win
    Link(N + 1, N + 1) = 1;

    % din Loose in Loose
    Link(N + 2, N + 2) = 1;

    % parcurgem fiecare celula din labirint
    % numaram in cate moduri isi poate continua drumul robotul
    % din fiecare pozitie
    for i = 1:m
        for j = 1:n
            % retinem in k indicele nodului curent
            % in current valoarea din labirint convertind intr-o matrice densa

            k = (i-1)*n + j;
            current = full(Labyrinth(i, j));


            % verificam vecinii sus, jos, stanga, dreapta
            % bit = 0 inseamna ca nu avem zid

            % numaram in ways nr de moduri de deplasare
            ways = 0;

            bit = bitand(current, bitshift(1,0));
            if bit == 0
              ways++;
            endif

            bit = bitand(current, bitshift(1,1));
            if bit == 0
              ways++;
            endif

            bit = bitand(current, bitshift(1,2));
            if bit == 0
              ways++;
            endif

            bit = bitand(current, bitshift(1,3));
            if bit == 0
              ways++;
            endif


            % daca avem vreo posibilitate de continuare a drumului
            % marcam in Link probabilitatea deplasarii in acea celula
            if ways ~= 0
              % vecinul de sus
              bit = bitand(current, bitshift(1,3));

              % marcam pentru Win sus
              if i == 1 && bit == 0
                Link(k, N + 1) = 1 / ways;
              endif

              % marcam pentru interior
              if in_matrix(m, n, i-1, j) ~= 0 && bit == 0
                k_top = (i-2)*n + j;
                Link(k, k_top) = 1 / ways;
              endif


              % vecinul de jos
              bit = bitand(current, bitshift(1,2));

              % marcam pentru Win jos
              if i == m && bit == 0
                Link(k, N + 1) = 1 / ways;
              endif

              % marcam pentru interior
              if in_matrix(m, n, i+1, j) ~= 0 && bit == 0
                k_bottom = i*n + j;
                Link(k, k_bottom) = 1 / ways;
              endif


              % vecinul din dreapta
              bit = bitand(current, bitshift(1,1));

              % marcam pentru loose dreapta
              if j == n && bit == 0
                Link(k, N + 2) = 1 / ways;
              endif

              % marcam pentru interior
              if in_matrix(m, n, i, j+1) ~= 0 && bit == 0
                k_right = (i-1)*n + j+1;
                Link(k, k_right) = 1 / ways;
              endif


              % vecinul din stanga
              bit = bitand(current, bitshift(1,0));

              % marcam pentru loose stanga
              if j == 1 && bit == 0
                Link(k, N + 2) = 1 / ways;
              endif

              % marcam pentru interior
              if in_matrix(m, n, i, j-1) ~= 0 && bit == 0
                k_left = (i-1)*n + j-1;
                Link(k, k_left) = 1 / ways;
              endif

            endif
        endfor
    endfor
endfunction
