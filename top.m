function position_coord = top(stack)
    if empty(stack)
        error("Stack is already empty.");
        return
    endif
    position_coord = stack(end, :);
endfunction
