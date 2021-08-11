function nCutValue = calculateNcut(anAffinityMat, clusterIdx)

    a_team = clusterIdx == 1;             
    b_team = clusterIdx == 2;             
    
    row_sums = sum(anAffinityMat, 2);     
    assocAV = sum(row_sums(a_team));      
    assocBV = sum(row_sums(b_team));      
    
    atoa = anAffinityMat(a_team, a_team);   
    assocAA = sum(atoa(:));               
    
    btob = anAffinityMat(b_team, b_team);  
    assocBB = sum(btob(:));               

    Nassoc = assocAA/assocAV + assocBB/assocBV;
    
    nCutValue = 2-Nassoc;
end

