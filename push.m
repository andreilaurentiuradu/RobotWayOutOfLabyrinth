function stack = push(stack, pos)
    [m, n] = size(stack);
    stack = [stack; pos];
endfunction
