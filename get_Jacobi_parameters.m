function [G, c] = get_Jacobi_parameters(Link)
  % Initializarea matricii G și vectorului c cu valori nule
  [n, n] = size(Link);
  G = zeros(n-2);
  c = zeros(n-2, 1);

  % Parcurgem primele n-2 linii și primele n-2 coloane ale matricii Link
  % pentru a construi matricea G
  for i = 1:n-2
    for j = 1:n-2
      if Link(i, j) ~= 0
        G(i, j) = Link(i, j);
      endif
    endfor
  endfor

  % Parcurgem primele n-2 elemente ale coloanei n-1 ale matricii Link
  % pentru a construi vectorul c
  for i = 1:n-2
    if Link(i, n-1) ~= 0
      c(i) = Link(i, n-1);
    endif
  endfor

  % Convertim matricea G și vectorul c în matrici rare
  G = sparse(G);
  c = sparse(c);

  endfunction
