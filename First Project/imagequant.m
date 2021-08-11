function q = imagequant(x, w1, w2, w3)

%Convert to double to avoid rounding errors
Image = double(x);

%quant for each chanel according to w 
r = myquant(Image(:, :, 1), w1);
g = myquant(Image(:, :, 2), w2);
b = myquant(Image(:, :, 3), w3);

%final image
q = cat(3, r, g, b);

end

