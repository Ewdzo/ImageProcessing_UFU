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

          labelN = labels(i-1, j);
          labelW = labels(i, j-1);

          if(N == 0 && W == 0)
            labels(i,j) = label;
            label = label + 1;
          else
            labels(i,j) = max(labelN, labelW);

            if(N == 1 && W == 1)
              idx = labels == labelW;
              labels(idx) = labelN;
            end
          end
        end
    endfor
endfor

imshow(labels, []);

