load('dip_hw_2.mat')
% initialize k-means algorithm
rng(1)                        

% affinity matrix of d2a 
graph1 = Image2Graph(d2a);
% affinity matrix of d2b 
graph2 = Image2Graph(d2b);  
 
% label of d2a image for k = 2,3,4 
labels_12 = mySpectralClustering(graph1, 2);
labels_13 = mySpectralClustering(graph1, 3);
labels_14 = mySpectralClustering(graph1, 4);
disp('Image d2a done.')

% label of d2b image for k = 2,3,4 
labels_22 = mySpectralClustering(graph2, 2);
labels_23 = mySpectralClustering(graph2, 3);
labels_24 = mySpectralClustering(graph2, 4);
disp('Image d2b done.')

% d2a for k=2,3,4
res12 = result(d2a, labels_12);
res13 = result(d2a, labels_13);
res14 = result(d2a, labels_14);

% d2b for k=2,3,4
res22 = result(d2b, labels_22);
res23 = result(d2b, labels_23);
res24 = result(d2b, labels_24);

%figures

 figure(1);
 h    = [];
 h(1) = subplot(2,2,1);
 image(d2a,'Parent',h(1));
 
 h(2) = subplot(2,2,2);
 image(res12,'Parent',h(2));
 title('k = 2');
 
 h(3) = subplot(2,2,3);
 image(res13,'Parent',h(3));
 title('k = 3');
 h(4) = subplot(2,2,4);
 image(res14,'Parent',h(4));
 title('k = 4');
 
 figure(2);
 h    = [];
 h(1) = subplot(2,2,1);
 image(d2b,'Parent',h(1));
 
 h(2) = subplot(2,2,2);
 image(res22,'Parent',h(2));
 title('k = 2');
 
 h(3) = subplot(2,2,3);
 image(res23,'Parent',h(3));
 title('k = 3');
 
 h(4) = subplot(2,2,4);
 image(res24,'Parent',h(4));
 title('k = 4');
