function [ xrgbres ] = myresize( xrgb, N, M, method )

    %initialization
    [n, m, ~] = size(xrgb);
    red = zeros(N, M);
    blue = zeros(N, M);
    green = zeros(N, M);
    
    r = xrgb(:,:,1);
    g = xrgb(:,:,2);
    b = xrgb(:,:,3);
    
    %bilinear interpolation
    if strcmp(method, 'linear')
        %width  
        x_ratio = m/M; 
        %height
        y_ratio = n/N;

        for i = 0:(N-1) 
            for j = 0:(M-1)
                x = floor(x_ratio * j);
                y = floor(y_ratio * i);
                x_diff = (x_ratio * j) - x;
                y_diff = (y_ratio * i) - y;

                %Red
                A = r(y+1,x+1); 
                B = r(y+1,x+1+1);
                C = r(y+1+1,x+1); 
                D = r(y+1+1,x+1+1);
                red(i+1,j+1) = A*(1 - x_diff)*(1 - y_diff)+ B*x_diff*(1 - y_diff)+ C*y_diff*(1 - x_diff)+ D*x_diff*y_diff;
                
                %Blue
                A = b(y+1,x+1);
                B = b(y+1,x+1+1);
                C = b(y+1+1,x+1); 
                D = b(y+1+1,x+1+1);
                blue(i+1,j+1) = A*(1 - x_diff)*(1 - y_diff)+ B*x_diff*(1 - y_diff)+ C*y_diff*(1 - x_diff)+ D*x_diff*y_diff;
                
                %Green
                A = g(y+1,x+1);
                B = g(y+1,x+1+1);
                C = g(y+1+1,x+1); 
                D = g(y+1+1,x+1+1);
                green(i+1,j+1) = A*(1 - x_diff)*(1 - y_diff)+ B*x_diff*(1 - y_diff)+ C*y_diff*(1 - x_diff)+ D*x_diff*y_diff;
                
            end
        end
    
    %nearest method
    elseif strcmp(method, 'nearest')
        %width  
        x_ratio =m/M; 
        %height
        y_ratio = n/N; 

        for i = 1:N
            for j = 1:M
                y = round(i*y_ratio);
                x = round(j*x_ratio);
                red(i, j) = r(y, x); 
                green(i, j) = g(y, x);
                blue(i, j) = b(y, x);
            end
        end
        
    end
    %final resized image
        xrgbres(:,:,1) = red;
        xrgbres(:,:,2) = green;
        xrgbres(:,:,3) = blue;
end

