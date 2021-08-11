load('dip_hw_2.mat')

% initialize k-means algorithm 
rng(1)     

% the affinity matrix from an Image with 12 pixel                    
afMat = d1a;         

% lab1: vector that sorts pixels from Image into 2 clusters
lab1 = mySpectralClustering(afMat, 2);

% lab2: vector that sorts pixels from Image into 3 clusters
lab2 = mySpectralClustering(afMat, 3);

% lab3: vector that sorts pixels from Image into 4 clusters
lab3 = mySpectralClustering(afMat, 4);