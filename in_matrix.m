function  [answer] = in_matrix (m, n, lin, col)
  answer = 1;
  if(lin < 1 || lin > m || col < 1 || col > n)
    answer = 0;
  endif

endfunction
