function clusterIdx = iterNCuts(anAffinityMat, threshold)

    T1 = threshold(1);   
    T2 = threshold(2);  
    
    pixels = size(anAffinityMat, 1);   
    clusterIdx = zeros([pixels 1]);     
    
    labels = myNCuts(anAffinityMat, 2);
    ncut = calculateNcut(anAffinityMat, labels);
    
    a_sum = sum(labels == 1);          
    b_sum = sum(labels == 2);           

    
    if a_sum < T1 || b_sum < T1 || ncut > T2  
        clusterIdx = labels;
    else
        A = find(labels == 1);         
        B = find(labels == 2);          

        graph1 = anAffinityMat(A, A);   
        graph2 = anAffinityMat(B, B);  
               
        labels1 = iterNCuts(graph1, threshold);    
        labels2 = iterNCuts(graph2, threshold);    
        
        clusterIdx(A) = labels1;
        clusterIdx(B) = labels2 + max(labels1(:));
    end
    
end


