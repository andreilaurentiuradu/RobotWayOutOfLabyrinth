function [Labyrinth] = parse_labyrinth (file_path)
  % deschide fisierul pentru citire
  file = fopen(file_path, 'r');

  % citeste dimensiunile labirintului (m, n)
  dimensions = fscanf(file, '%d %d', [1, 2]);
  m = dimensions(1)
  n = dimensions(2)

  %initializeaza matricea rara
  Labyrinth = sparse(m, n);

  %citeste restul fisierului si completeaza matricea
  row = 1;

  %scapam de enter
  fgets(file);
  while ~feof(file)
    % citeste o linie
    line = fgets(file)

    %extrage valorile
    values = sscanf(line, '%d')

    %adauga valorile in matrice
    Labyrinth(row, :) = values;
    row++;
  endwhile

  %inchide fisierul
  fclose(file);
endfunction
