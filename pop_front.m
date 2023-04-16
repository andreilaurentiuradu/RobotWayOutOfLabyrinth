function stack = pop_front(stack)
    if empty(stack)
        error("Stack is already empty.");
        return
    endif
    [m, n] = size(stack);
    stack(1, :) = [];
endfunction
