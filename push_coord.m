function stack = push(stack, lin, col)
    [m, n] = size(stack);
    stack = [stack; lin, col];
endfunction
