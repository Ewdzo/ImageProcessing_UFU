function smooth = smoothness(img, x, y)
      green = img(:,:,2);

      values = [
        green(x-4, y-4), green(x-3, y-4), green(x-2, y-4), green(x-1, y-4), green(x, y-4), green(x+1, y-4), green(x+2, y-4), green(x+3, y-4), green(x+4, y-4);
        green(x-4, y-3), green(x-3, y-3), green(x-2, y-3), green(x-1, y-3), green(x, y-3), green(x+1, y-3), green(x+2, y-3), green(x+3, y-3), green(x+4, y-3);
        green(x-4, y-2), green(x-3, y-2), green(x-2, y-2), green(x-1, y-2), green(x, y-2), green(x+1, y-2), green(x+2, y-2), green(x+3, y-2), green(x+4, y-2);
        green(x-4, y-1), green(x-3, y-1), green(x-2, y-1), green(x-1, y-1), green(x, y-1), green(x+1, y-1), green(x+2, y-1), green(x+3, y-1), green(x+4, y-1);
        green(x-4, y), green(x-3, y), green(x-2, y), green(x-1, y), green(x, y), green(x+1, y), green(x+2, y), green(x+3, y), green(x+4, y);
        green(x-4, y+1), green(x-3, y+1), green(x-2, y+1), green(x-1, y+1), green(x, y+1), green(x+1, y+1), green(x+2, y+1), green(x+3, y+1), green(x+4, y+1);
        green(x-4, y+2), green(x-3, y+2), green(x-2, y+2), green(x-1, y+2), green(x, y+2), green(x+1, y+2), green(x+2, y+2), green(x+3, y+2), green(x+4, y+2);
        green(x-4, y+3), green(x-3, y+3), green(x-2, y+3), green(x-1, y+3), green(x, y+3), green(x+1, y+3), green(x+2, y+3), green(x+3, y+3), green(x+4, y+3);
        green(x-4, y+4), green(x-3, y+4), green(x-2, y+4), green(x-1, y+4), green(x, y+4), green(x+1, y+4), green(x+2, y+4), green(x+3, y+4), green(x+4, y+4);
      ];

      values = green(x,y) - values ;
      values = abs(values);
      values = sum(sum(values));
      values = values / 81;

      smooth = values;
endfunction
