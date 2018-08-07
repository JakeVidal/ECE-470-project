[X,Y] = meshgrid(0:1:100);
%Z =(100*X.^2 +X.*Y.^2).*(1-sigmf(Y,[.1 100]));
%Z = 10*(sigmf(X,[1 10])+sigmf(X,[1 20])+sigmf(X,[1 30])+sigmf(X,[1 40])+sigmf(X,[1 50])+sigmf(X,[1 60])+sigmf(X,[1 70])+sigmf(X,[1 80])+sigmf(X,[1 90])).*(sigmf(Y,[1 10])+sigmf(Y,[1 20])+sigmf(Y,[1 30])+sigmf(Y,[1 40])+sigmf(Y,[1 50])+sigmf(Y,[1 60])+sigmf(Y,[1 70])+sigmf(Y,[1 80])+sigmf(Y,[1 90]));
%Z = 5*X+Y
CO(:,:,1) = ones(100).*linspace(0.8,0.3,100); % red
CO(:,:,2) = ones(100).*linspace(0,0.8,100); % green
CO(:,:,3) = ones(100).*linspace(0.2,0,100); % blue
s = surf(X,Y,Z,CO);
s.EdgeColor = [0.4 0.3 0.3];
xlabel('Accuracy');
ylabel('Features Removed');
zlabel('Fitness');

