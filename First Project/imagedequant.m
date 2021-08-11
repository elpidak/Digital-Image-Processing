function x = imagedequant(q, w1, w2, w3)
%IMAGEDEQUANT Decodes a Quantized/Encoded Image 

%dequant for each color channel according to w
qr = mydequant(q(:, :, 1), w1);
qg = mydequant(q(:, :, 2), w2);
qb = mydequant(q(:, :, 3), w3);

%final image
x = cat(3, qr, qg, qb);
end

