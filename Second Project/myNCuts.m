function clusterIdx = myNCuts(anAffinityMat ,k)

    D = sum(anAffinityMat, 2);  
    D = diag(D);                
    L = D - anAffinityMat;      
    
    [U, ~] = eigs(L,D,k,'sm');  
    clusterIdx = kmeans(U, k);  
end

