% K nearest neighbors algorithm
% 1. This function implements the KNN algorithm

% Input:
% x: data point to be classified.
% X: training data           % containing 3 data classes, each with m samples.
% Y: training data labels    % m: size of each training class.
% K: integer parameter K for KNN algorithm.
% Output:
% ks: predicted class to which input x belongs.

function [Class] = KNN(x,X,Y,K)

x = gpuArray(x);
X = gpuArray(X);
Y = gpuArray(Y);

[~,n] = size(X);
n2 = n-sum(Y);
%m2 = 2*m;
%m3 = 3*m;
ds = zeros(1,n);

for i = 1:n
    ds(i) = norm(x-X(:,i));
end

[~,ind1] = sort(ds);
indk = ind1(1:K);
c1 = 0;% c2 = 0; 
c3 = 0;

for t = 1:K
	iw = indk(t);
    if iw <= n2
        c1 = c1 + 1;
	%elseif iw > m & iw <= m2
     %   c2 = c2 + 1;
    elseif iw > n2
    c3 = c3 + 1;
    end
end
[~,ks] = max([c1 c3]); 
Class = ks-1;
end