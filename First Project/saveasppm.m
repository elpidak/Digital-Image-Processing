function saveasppm(x, filename, K)

%height and width of the image
[height, width] = size(x(:, :, 1));

%Combine all pixel colors information in the image
r = x(:,:,1);
r = r';
r = r(:);

g = x(:,:,2);
g = g';
g = g(:);

b = x(:,:,3);
b = b';
b = b(:);

img = [r, g, b]';

%Create the filename.ppm file
fileID = fopen(filename, 'w');

%Print the Header Information
formatSpec = 'P6 %i %i %i\n';
fprintf(fileID, formatSpec, width, height, K);

%Print the Image Information
if K <= 255 
    fwrite(fileID, img, 'uint8');
else
    fwrite(fileID, img, 'uint16', 'b');
end

fclose(fileID);

imshow(filename);
end

