pkg load image

names = ["insitu107595.jpg"; "insitu107596.jpg"; "insitu107597.jpg"; "insitu107598.jpg"; "insitu107599.jpg"; "insitu107600.jpg"; "insitu107601.jpg"; "insitu107602.jpg"];
imgSrc = cellstr(names);

for i = 1:8

  img = imread(imgSrc{i});
  img = rgb2gray(img);
  #img = imfilter(img, fspecial("average", [5,5]));
  threshold = sum(sum(img))/ (size(img,1) * size(img,2));
  newThreshold = 0;

  while( abs(newThreshold - threshold) > (0.1*threshold) )
    G1 = img;
    G2 = img;

    G1(img > threshold) = 0;
    G2(img < threshold) = 0;

    G1 = nonzeros(G1);
    G2 = nonzeros(G2);
    G1 = sum(G1) / size(G1,1);
    G2 = sum(G2) / size(G2,1);

    threshold = newThreshold;
    newThreshold = ((G1+G2) / 2);
  endwhile

  segmented = zeros(size(img));
  segmented(img < threshold) = 1;

  subplot(4, 2, (i));
  imshow(segmented);
endfor
