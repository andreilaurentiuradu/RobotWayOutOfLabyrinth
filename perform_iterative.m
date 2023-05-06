function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)

  % nu mai avem nevoie sa impartim la ce e pe diagonala pentru ca vom avea
  % 0 pe diagonala principala mereu
  #succes = 0;
  [n n]=size(G);
  x=zeros(n,1)
  steps = 0;

  % sa verifici daca e coloana
##  if ~iscolumn(x0)
##    x0 = x0(:);
##  endif
function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)

  % nu mai avem nevoie sa impartim la ce e pe diagonala pentru ca vom avea
  % 0 pe diagonala principala mereu

  % aflam dimensiunea matricii G
  [n n]=size(G);

  % initializam vectorul solutie si nr de pasi
  x=zeros(n,1);
  steps = 0;

  % aplicam Jacobi
  prev_x = x0;
  while(1)
    x = G * prev_x + c;
    err = norm(x - prev_x);
    steps = steps + 1;

    % daca s-a ajuns la nr de pasi sau am ajuns la o eroare acceptabila
    if(err <= tol || steps == max_steps)
      return
    endif

    prev_x = x;
  endwhile
endfunction
  prev_x = x0;
  while(1)
    x = G * prev_x + c;
    err = norm(x - prev_x);
    steps = steps + 1;

    %verificare solutie
    if((err <= tol) || (steps == max_steps))
      #disp("Am gasit solutia");
      #succes = 1
      return
    endif

    prev_x = x;
  endwhile

endfunction
