function SKEDET = skeletonCandidate(img, x, y)
      gray = rgb2gray(img);
      Pn0 = 0;
      Pn1 = 0;

      for i=1:9
        for j=1:9

          positionX = x-(5-i);
          positionY = y-(5-j);
          if(gray(positionX, positionY) > 60 && gray(positionX, positionY) < 230)
              if((gray(positionX, positionY) - gray(x,y)) > 1)
                  Pn0 = Pn0 + 1;
              else
                  Pn1 = Pn1 + 1;
              endif
          endif
        endfor
      endfor

      if(Pn0 > 10 && Pn1 > (0.65 * Pn0))
        SKEDET = 1;
      else
        SKEDET = 0;
      endif
endfunction
