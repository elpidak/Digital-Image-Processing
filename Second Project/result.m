function clustered = result(imIn, labels)
    
    imWidth = size(imIn, 1);
    clusters = size(unique(labels), 1);
    
    labels = vec2mat(labels, imWidth); 
    
    %random
    randColor = rand(clusters, 3);     
    
    %RGB
    Ir = imIn(:, :, 1);
    Ig = imIn(:, :, 2);
    Ib = imIn(:, :, 3);
    
    % weight 
    kmax = 50;
    degree = 2;
    wr = 1 - exp(-((unique(labels) - 1)/kmax).^degree);
    
    for k = 1 : clusters
        
        idx = find(labels == k);

        % average RGB 
        Ravg = mean(Ir(idx));
        Gavg = mean(Ig(idx));
        Bavg = mean(Ib(idx));

        Ir(idx) = (1 - wr(k)) * Ravg + wr(k) * randColor(k, 1);
        Ig(idx) = (1 - wr(k)) * Gavg + wr(k) * randColor(k, 2);
        Ib(idx) = (1 - wr(k)) * Bavg + wr(k) * randColor(k, 3);
    end
    
   clustered = cat(3,Ir,Ig,Ib);
end



