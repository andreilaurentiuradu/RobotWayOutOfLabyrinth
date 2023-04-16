
##  1: procedure heuristic_greedy(start_position, probabilities, adjacency_matrix)
function [path] = heuristic_greedy(start_position, probabilities, Adj)

# luam nr de linii ale matricei Adj, adica nr de noduri ale grafului
  [N, N] = size(Adj);
  #2: path ← [start_position]
  path = start_position;

  visited = zeros(N, 1)

  ##3: visited[start_position] ← True
  visited(start_position) = 1;

  ##4: while path is not empty do
  while(~empty(path))
    ##5: position ← top() / last element of the path vector
    position = top(path)

    ##6: if position is the WIN state then
    if position == N - 1
        return
    endif

    best_neigh = -1;
    for i = 1 : N
      # daca ne putem deplasa din position in i si nu am facut-o deja
      if Adj(position, i) == 1 && visited(i) == 0
        if best_neigh == -1 || probabilities(i) > probabilities(best_neigh)
          best_neigh = i;
        endif
      endif
    endfor

    ##8: if position has no unvisited neighbours then
    ##9: erase position from the end of the path
    if best_neigh == -1
      path = pop(path);
    else
      ##10: neigh ← the unvisited neighbour
      ##(with greatest probability to reach WIN) of the current position
      ##11: visited[neigh] ← True
      visited(best_neigh) = 1;
      ##12: path ← [path, neigh]
      path = push(path, best_neigh);
    endif
  endwhile

endfunction
