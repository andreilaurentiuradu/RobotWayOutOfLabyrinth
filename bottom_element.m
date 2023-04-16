function position_coord = bottom_element(stack)
    if empty(stack)
        error("Stack is already empty.");
        return
    endif
    position_coord = stack(1);
endfunction
