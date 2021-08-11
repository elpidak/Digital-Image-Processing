clear; 
%load tha matrix march
x = load('march.mat');
BAYER = x.x;
%call the function
RGB = bayer2rgb(BAYER);
figure;
imshow(RGB);
title 'RGB Image from Bayer Filter';