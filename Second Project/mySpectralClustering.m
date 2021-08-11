function clusterIdx = mySpectralClustering(anAffinityMat , k)

    D = sum(anAffinityMat, 2);  
    D = diag(D);
    
    %laplace                           
    L = D - anAffinityMat;      
    
    [U, ~] = eigs(L, k, 'sm');                              
    clusterIdx = kmeans(U, k);  
end