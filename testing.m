% Genetic algorithm testing script
% 1. This script generates an initial population of solutions
% 2. This script runs the genetic algorithm on the initial population
population = 100;
num_features = 30;
mutation_rate = 1; %this is a source of error, debug in genetic.m, set to 1
crossover_rate = 0.5;

for i = 1:population
    chromosomes(:,i) = round(rand(num_features,1));
end

for j = 1:20
    [chromosomes,fitness] = genetic(chromosomes,num_features,population,crossover_rate,mutation_rate);
    result(j) = sum(fitness);
end
plot(1:100,result(1:100))
axis([0 20 0 3000])