clear; 
%load tha matrix march
x = load('march.mat');
BAYER = x.x;
%call the function
RGB = bayer2rgb(BAYER);

%the resized image with the bilinear interpolation method
resizedByLinear = myresize(RGB, 200, 300, 'linear');
figure;
imshow(resizedByLinear);
title 'Resized Image with the method Linear';

%the resized image with the nearest method
resizedByNearest = myresize(RGB, 240, 320, 'nearest');
figure;
imshow(resizedByNearest);
title 'Resized Image with the method Nearest';
