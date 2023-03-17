img = imread('clc3thr1.png');

img = padarray(img, [1,1]);

labels = zeros(size(img,1), size(img,2));
label = 1;

for i=2:size(img,1)
    for j=2:size(img,2)
        if(img(i,j) != 0)
          N = img(i-1, j);
          W = img(i, j-1);
          NW = img(i-1, j-1);
          NE = img(i-1, j+1);

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
