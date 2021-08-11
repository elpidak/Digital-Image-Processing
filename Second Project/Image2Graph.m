function myAffinityMat = Image2Graph (imIn)
 
   %image dimentions and channels
   [imHeight, imWidth, ~] = size(imIn); 
    
    imInv = permute(imIn, [2 1 3]);     
    imVec = reshape(imInv,1,imHeight*imWidth,3);
    % calculate the affinity matrix with v2v
    myAffinityMat = v2v(imVec);
end


function res = v2v(vec)

    v_squared_sum = sum(vec.^2, 3);     % dim: 1 x N*N x 3
    v = v_squared_sum'+v_squared_sum;   % dim: N*N x N*N x 3
    v11 = permute(vec, [2 3 1]);        % dim: N*N x 3 (x 1)
    mid_term = -2*(v11*v11');           % dim: N*N x N*N x 3
    
    dist = v+mid_term; 
    % due to small errors we have negative 
    dist(dist<0)=0;                 
    % ½  1/e^d(i,j)
    res = 1./exp(sqrt(dist));
end
    

