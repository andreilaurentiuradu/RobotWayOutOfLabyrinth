function result = empty(stack)
    [m, n] = size(stack);
    result = 0;
    if m == 0
      result = 1;
    endif
endfunction
