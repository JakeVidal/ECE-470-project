% Genetic algorithm testing script
% 1. This script generates an initial population of solutions
% 2. This script runs the genetic algorithm on the initial population
population = 10;
num_features = 30;

for i = 1:population
    chromosomes(:,i) = round(rand(num_features,1));
end

genetic(chromosomes,population)