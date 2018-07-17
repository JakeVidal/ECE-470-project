% Genetic algorithm testing script
% 1. This script generates an initial population of solutions
% 2. This script runs the genetic algorithm on the initial population
population = 20;
num_features = 369;
mutation_rate = 0.012;
crossover_rate = 0.5;
generations = 25;

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
    [chromosomes,fitness] = genetic(chromosomes,num_features,population,...
    crossover_rate,mutation_rate,Xtrain,Xtest,Ytrain,Ytest);
    toc
    result(j) = max(fitness);
end

plot(1:generations,result(1:generations))
axis([0 generations 0 5]);
xlabel('generations');
ylabel('fitness');
