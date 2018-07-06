% Genetic algorithm testing script
% 1. This script generates an initial population of solutions
% 2. This script runs the genetic algorithm on the initial population

for i = 1:10
    chromosomes(:,i) = round(rand(30,1));
end


genetic(chromosomes)