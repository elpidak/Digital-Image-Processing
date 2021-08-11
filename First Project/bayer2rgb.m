function  [xrgb] = bayer2rgb(xb)
% function that converts a bayer image to an RGB image

    % Initialization
    [M, N] = size(xb);

    xrgb = zeros(M, N, 3);
    red = zeros(M, N);
    green = zeros(M, N);
    blue = zeros(M, N);

    %color plane array
    red(2:2:end, 1:2:end) = xb(2:2:end, 1:2:end);
    blue(1:2:end, 2:2:end) = xb(1:2:end, 2:2:end);
    green(1:2:end, 1:2:end) = xb(1:2:end, 1:2:end);
    green(2:2:end, 2:2:end) = xb(2:2:end, 2:2:end);

    % convolution kernels
    Kr = (1/4) * [1 2 1; 2 4 2; 1 2 1];
    Kb = (1/4) * [1 2 1; 2 4 2; 1 2 1];
    Kg = (1/4) * [0 1 0; 1 4 1; 0 1 0];

   
    convolutionr = conv2(red, Kr, 'same');
    convolutiong = conv2(green, Kg, 'same');
    convolutionb = conv2(blue, Kb, 'same');

    %final xb
    xrgb(:,:,1) = convolutionr;
    xrgb(:,:,2) = convolutiong;
    xrgb(:,:,3) = convolutionb;
    
    
end

