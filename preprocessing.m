% Data preprocessing script
% This script preprocesses datasets, generating training and testing sets

function [ Xtrain, Xtest, Ytrain, Ytest ] = Preprocess( )

load train.csv

T = transpose(train);
[m,n] = size(T);

X = T(1:(m-1),:);
Y = T(m,:);

Xh = zeros(m,n);
for i = 1:(m-1)
    xi = X(i,:);
    mi = mean(xi);
    vi = sqrt(var(xi));
    if vi ~= 0
        Xh(i,:) = ((xi) - mi)/vi;
    end
end

indn = find(Y == 0);
indp = find(Y == 1);
Xn = Xh(1:(m-1),indn);
Xp = Xh(1:(m-1),indp);

% select a random portion of the dataset for testing and training
[~,n1] = size(Xn);
[~,n2] = size(Xp);
n1trn = round(n1*0.8);
n1test = n1trn+1;
n2trn = round(n2*0.8);
n2test = n2trn+1;

%rand('state',8)
%r1 = randperm(357);
Xntr = Xn(:,(1:n1trn));
Xnte = Xn(:,(n1test:n1));
%rand('state',7)
%r2 = randperm(212);
Xptr = Xp(:,(1:n2trn));
Xpte = Xp(:,(n2test:n2));

Xtrain = [Xntr Xptr];
Ytrain = [zeros(1,n1trn), ones(1,n2trn)];

Xtest = [Xnte Xpte];
Ytest = [zeros(1,(n1-n1test)), ones(1,(n2-n2test))];


% 2-d plot to visualize distance
%testplot( Xntr, Xptr, n1trn, n2trn )

end