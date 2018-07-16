% Genetic algorithm testing script
% 1. This script generates an initial population of solutions
% 2. This script runs the genetic algorithm on the initial population
population = 10;
num_features = 369;
mutation_rate = 0.02;
crossover_rate = 0.5;
generations = 5;
device = gpuDevice();

% [Xtrain,Xtest,Ytrain,Ytest] = preprocessing;
load Xtrain
load Xtest
load Ytrain
load Ytest

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

reset(device);
plot(1:generations,result(1:generations))
axis([0 generations 0 100]);
xlabel('generations');
ylabel('accuracy(%)');