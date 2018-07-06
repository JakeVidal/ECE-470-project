% Genetic algorithm function
% 1. This function takes an initial population as input
% 2. This function evaluates the fitness of the candidates
% 3. This function selects pairs for generating a new population
% 4. This function breeds the pairs using mutation and crossover
% 5. This function returns the new population

function [new_chromosomes] = genetic(chromosomes)
    for i = 1:10
        fitness(i) = sum(chromosomes(:,i));
    end    
    fitness
    [a,b] = sort(fitness,'descend')
    
%     for j = 1:55
%         choice_raffle(j) = 
%     end
end

