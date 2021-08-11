load('dip_hw_2.mat')
% initialize k-means algorithm
rng(1) 

% affinity matrix of d2a
graph1 = Image2Graph(d2a); 
% affinity matrix of d2b
graph2 = Image2Graph(d2b);   

labels1 = myNCuts(graph1, 2);
ncut1 = calculateNcut(graph1, labels1);
disp('Image d2a done.')

labels2 = myNCuts(graph2, 2);
ncut2 = calculateNcut(graph2, labels2);
disp('Image d2b done.')

res1 = result(d2a, labels1);
res2 = result(d2b, labels2);


%figures

figure;
h    = [];
h(1) = subplot(2,2,1);
h(2) = subplot(2,2,2);

image(d2b, 'Parent',h(1));

image(d2a, 'Parent',h(2));

h(3) = subplot(2,2,3);
image(res2,'Parent',h(3));
title(['ncut: ', num2str(ncut2)]);

h(4) = subplot(2,2,4);
image(res1,'Parent',h(4));
title(['ncut: ', num2str(ncut1)]);


