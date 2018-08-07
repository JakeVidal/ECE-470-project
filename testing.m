%==========================================================================
% Genetic algorithm testing script
%==========================================================================

% load the datasets (training and testing) and their associated labels
load Xtrain
load Xtest
load Ytrain
load Ytest

% global variables for the simulation
population = 25;
num_features = 106;
mutation_rate = 0.01;
crossover_rate = 0.5;
generations = 250;
fitness_select = 'default';

% preallocation of arrays to hold results
fitness_result = zeros(1,generations);
accuracy = zeros(1,generations);
features_used = zeros(1,generations);
mean_fitness = zeros(1,generations);
mean_accuracy = zeros(1,generations);
mean_features = zeros(1,generations);

% initialization for the GUI, creates interface with empty graphs
[population,mutation_rate,fitness_select] = GUI('initialize',fitness_result,...
accuracy,features_used,mean_fitness,mean_accuracy,mean_features,generations,...
0,population,mutation_rate,fitness_select);

% generates an initial set of chromosomes that use all features as a base
chromosomes = ones(num_features,population);

% main program loop, runs genetic algorithm on a population for j generations
for j = 1:generations
    
    % genetic algorithm executed on the most recent population of chromosomes
    tic
    [chromosomes,fit,acc,used] = genetic(chromosomes,num_features,population,...
    crossover_rate,mutation_rate,Xtrain,Xtest,Ytrain,Ytest,fitness_select);
    toc
    
    % record performance results of the generation of chromosomes
    fitness_result(j) = max(fit);
    [accuracy(j), index] = max(acc);
    features_used(j) = used(index);
    mean_fitness(j) = mean(fit);
    mean_accuracy(j) = mean(acc);
    mean_features(j) = mean(used);
    
    % update the GUI by passing the performance results 
    [population,mutation_rate,fitness_select] = GUI('update',fitness_result,...
    accuracy,features_used,mean_fitness,mean_accuracy,mean_features,generations,...
    j,population,mutation_rate,fitness_select);
    
%     if j == generations
%         [fitness_result(j); mean_fitness(j)]
%         [accuracy(j) features_used(j);...
%         mean_accuracy(j) mean_features(j)]
%     end
end

