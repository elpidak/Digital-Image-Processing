clear; close all;clc;
%load tha matrix march
x = load('march.mat');
BAYER = x.x;

RGB = bayer2rgb(BAYER);

RGB2 = myresize(RGB, 150, 200, 'linear');
figure;
imshow(RGB2);
title 'Resized Image with the method Linear';

w = 1/8;
q = imagequant(RGB2, w, w, w);
figure;
imshow(q);
title 'Quantized Image';

RGB3 = q;
k = 8;
saveasppm(RGB3, 'dip_is_fun.ppm', k);
figure;
imshow('dip_is_fun.ppm');
title 'PPM Image';

