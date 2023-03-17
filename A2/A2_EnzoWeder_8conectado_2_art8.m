img = imread('art8.png');

img = padarray(img, [1,1]);

labels = zeros(size(img,1), size(img,2));
label = 1;

for i=2:size(img,1)
    for j=2:size(img,2)
        if(img(i,j) != 0)
          N = img(i-1, j);
          W = img(i, j-1);

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
