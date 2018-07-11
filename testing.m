% Genetic algorithm testing script
% 1. This script generates an initial population of solutions
% 2. This script runs the genetic algorithm on the initial population
population = 10;
num_features = 369;
mutation_rate = 0.01;
crossover_rate = 0.5;
generations = 5;

% [Xtrain,Xtest,Ytrain,Ytest] = Preprocess;
load Xtrain
load Xtest
load Ytrain
load Ytest

chromosomes = zeros(num_features,population);
for i = 1:population
    chromosomes(:,i) = round(rand(num_features,1));
end

for j = 1:generations
    [chromosomes,fitness] = genetic(chromosomes,num_features,population,...
    crossover_rate,mutation_rate,Xtrain,Xtest,Ytrain,Ytest);

    result(j) = sum(fitness);
end
plot(1:generations,result(1:generations))
axis([0 generations 0 population*100])