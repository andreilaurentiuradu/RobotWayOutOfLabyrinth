function stack = pop(stack)
    if empty(stack)
        error("Stack is already empty.");
        return
    endif
    [m, n] = size(stack);
    stack(end, :) = [];
endfunction
