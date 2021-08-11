clear; 
%load tha matrix march
x = load('march.mat');
BAYER = x.x;
%call the function
RGB = bayer2rgb(BAYER);

w = 1/8; 
q = imagequant(RGB, w, w, w);
figure;
imshow(q);
title 'Quantized Image';

d = imagedequant(q, w, w, w);
figure;
imshow(d);
title 'Dequantized Image';
