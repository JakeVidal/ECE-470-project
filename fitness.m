[X,Y] = meshgrid(0:1:100);
Z =(100*X.^2 +X.*Y.^2).*(1-sigmf(Y,[.1 100]));
%Z =(100*X.^2 +X.*Y.^2).*(.5+sigmf(X,[1 60]));
%Z =(1.15).^X +X.*Y.^2;
CO(:,:,1) = ones(100).*linspace(0.8,0.3,100); % red
CO(:,:,2) = ones(100).*linspace(0,0.8,100); % green
CO(:,:,3) = ones(100).*linspace(0.2,0,100); % blue
s = surf(X,Y,Z,CO)
s.EdgeColor = [0.4 0.3 0.3];
xlabel('Accuracy');
ylabel('Features Removed');
zlabel('Fitness');
hold on
scatter3(10:5:100,10:5:100,100000:50000:1000000, 'k', 'f');
hold off
