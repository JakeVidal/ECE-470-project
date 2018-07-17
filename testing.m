% Genetic algorithm testing script
% 1. This script generates an initial population of solutions
% 2. This script runs the genetic algorithm on the initial population
population = 15;
num_features = 369;
mutation_rate = 0.015;
crossover_rate = 0.5;
generations = 30;
fitness_result = zeros(1,generations);
accuracy = zeros(1,generations);
features_used = zeros(1,generations);


GUI('initialize', fitness_result, accuracy, features_used, generations, 0)

% [Xtrain,Xtest,Ytrain,Ytest] = preprocessing;
load Xtrain
load Xtest
load Ytrain
load Ytest
Xtrain = Xtrain(:,56004:60816);
Ytrain = Ytrain(:,56004:60816);

chromosomes = zeros(num_features,population);
for i = 1:population
    chromosomes(:,i) = round(rand(num_features,1));
end

for j = 1:generations
    tic
    [chromosomes,fit,acc,used] = genetic(chromosomes,num_features,population,...
    crossover_rate,mutation_rate,Xtrain,Xtest,Ytrain,Ytest);
    toc
    fitness_result(j) = max(fit);
    [accuracy(j), index] = max(acc);
    features_used(j) = used(index);
    GUI('update', fitness_result, accuracy, features_used, generations, j)
end

