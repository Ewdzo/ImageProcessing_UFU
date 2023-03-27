function mapping = equalize(img,L)
    img = double(img)/(L-1);
    histArray = histeq(img,L)(:);
    histArray = histArray * L;

    mapping = unique(uint8(histArray));
endfunction
