# luam coordonatele starii din labirint


  #le adaugam in drum

##  path = [start_i, start_j];
##  path = push(path, 2, 3);
##  path = push(path, 4, 5);
function [decoded_path] = decode_path(path, lines, cols)
    decoded_path = zeros(0, 2);
    # cat timp drumul nu este gata
    while ~empty(path)
      position = bottom_element(path);
      position_line = fix(position / (lines + 1)) + 1;
      position_cols = position - lines * (position_line - 1);
      path = pop_front(path);
      decoded_path = push_coord(decoded_path, position_line, position_cols);
    endwhile

    # castigam daca e pe coloana de dupa ultima
    if decoded_path(end, 2) == cols + 1
      display('Am castigat');
    endif

    # pierdem daca e la doua distanta
    if decoded_path(end, 2) == cols + 2
      display('Am pierdut');
    endif

    decoded_path(end, :) = [];
endfunction
