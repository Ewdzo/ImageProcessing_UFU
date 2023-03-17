BW = uint8([0 0 0 0 0 0 0 0 0;
 0 1 1 1 0 0 0 0 0;
 0 1 1 1 0 1 1 0 0;
 0 1 1 1 0 1 1 0 0;
 0 1 1 1 0 0 0 1 0;
 0 1 1 1 0 0 0 1 0;
 0 1 1 1 0 0 0 1 0;
 0 1 1 1 0 0 1 1 0;
 0 1 1 1 0 0 0 0 0;
 0 0 0 0 0 0 0 0 0]);

BW = padarray(BW, [1,1]);

labels = zeros(size(BW,1), size(BW,2));
label = 1;

for i=2:size(BW,1)
    for j=2:size(BW,2)
        if(BW(i,j) != 0)
          N = BW(i-1, j);
          W = BW(i, j-1);
          NW = BW(i-1, j-1);
          NE = BW(i-1, j+1);

          labelN = labels(i-1, j);
          labelW = labels(i, j-1);
          labelNW = labels(i-1, j-1);
          labelNE = labels(i-1, j+1);

          if(N == 0 && W == 0 && NW == 0 && NE == 0)
            labels(i,j) = label;
            label = label + 1;
          else
            labels(i,j) = max(max(labelN, labelW), max(labelNW, labelNE));

            if(NW == 1 && NE == 1)
              idx = labels == labelNE;
              labels(idx) = labelNW;
            end

            if(NW == 1 && N == 1)
              idx = labels == labelN;
              labels(idx) = labelNW;
            end

             if(NW == 1 && W == 1)
              idx = labels == labelW;
              labels(idx) = labelNW;
            end
          end
        end
    endfor
endfor

imshow(labels, []);
