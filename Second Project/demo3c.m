load('dip_hw_2.mat');
% initialize k-means algorithm
rng(1)                      

% affinity matrix of d2a
graph1 = Image2Graph(d2a);  
% affinity matrix of d2b
graph2 = Image2Graph(d2b);   

%T1 = 5  and  T2 = 0.2
threshold = [5 0.2];                     
labels1 = iterNCuts(graph1, threshold);
disp('Image d2a done.')

labels2 = iterNCuts(graph2, threshold);
disp('Image d2b done.')

res1 = result(d2a, labels1);
res2 = result(d2b, labels2);

%figures
figure;
h    = [];
h(1) = subplot(2,2,1);
image(d2b, 'Parent',h(1));

h(2) = subplot(2,2,2);
image(d2a, 'Parent',h(2));

h(3) = subplot(2,2,3);
image(res2,'Parent',h(3));
title(['T1 = ', num2str(threshold(1)),'   T2 = ',num2str(threshold(2)),...
       '   k = ', num2str(max(labels2))]);

h(4) = subplot(2,2,4);
image(res1,'Parent',h(4));
title(['T1 = ', num2str(threshold(1)),'   T2 = ',num2str(threshold(2)),...
       '   k = ', num2str(max(labels1))]);
