% Genetic algorithm testing script
% 1. This script generates an initial population of solutions
% 2. This script runs the genetic algorithm on the initial population
load Xtrain
load Xtest
load Ytrain
load Ytest

population = 20;
num_features = 106;
mutation_rate = 0.02;
crossover_rate = 0.5;
generations = 1000;
fitness_select = 'default';

fitness_result = zeros(1,generations);
accuracy = zeros(1,generations);
features_used = zeros(1,generations);

mean_fitness = zeros(1,generations);
mean_accuracy = zeros(1,generations);
mean_features = zeros(1,generations);

[population,mutation_rate,fitness_select] = GUI('initialize',fitness_result,accuracy,features_used,mean_fitness,mean_accuracy,mean_features,generations,0,population,mutation_rate,fitness_select);

chromosomes = ones(num_features,population);
% for i = 1:population
%     chromosomes(:,i) = round(rand(num_features,1));
% end

for j = 1:generations
    tic
    [chromosomes,fit,acc,used] = genetic(chromosomes,num_features,population,...
    crossover_rate,mutation_rate,Xtrain,Xtest,Ytrain,Ytest,fitness_select);
    toc
    
    fitness_result(j) = max(fit);
    [accuracy(j), index] = max(acc);
    features_used(j) = used(index);
    
    mean_fitness(j) = mean(fit);
    mean_accuracy(j) = mean(acc);
    mean_features(j) = mean(used);
    
    [population,mutation_rate,fitness_select] = GUI('update',fitness_result,accuracy,features_used,mean_fitness,mean_accuracy,mean_features,generations,j,population,mutation_rate,fitness_select);
end

