function [Labyrinth] = parse_labyrinth (file_path)

  % deschidem fisierul pentru citire
  file = fopen(file_path, 'r');

  % citim dimensiunile labirintului (m, n)
  dimensions = fscanf(file, '%d %d', [1, 2]);
  m = dimensions(1)
  n = dimensions(2)

  % initializam matricea rara
  Labyrinth = sparse(m, n);

  % initializam nr de linii ale matricii
  row = 1;

  % scapam de enter
  fgets(file);

  % citim restul fisierului si completam matricea
  while ~feof(file)

    % citim o linie
    line = fgets(file)

    % extragem valorile
    values = sscanf(line, '%d')

    % adaugam valorile in matrice
    Labyrinth(row, :) = values;

    % incrementam numarul de linii
    row++;
  endwhile

  % inchidem fisierul
  fclose(file);
endfunction
