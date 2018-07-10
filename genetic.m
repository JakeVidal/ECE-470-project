% Genetic algorithm function
% 1. This function takes an initial population as input
% 2. This function evaluates the fitness of the candidates
% 3. This function selects pairs for generating a new population
% 4. This function breeds the pairs using mutation and crossover
% 5. This function returns the new population

function [new_chromosomes] = genetic(chromosomes,population)
    for i = 1:population
        fitness(i) = sum(chromosomes(:,i));
    end    

    [~,f] = sort(fitness,'descend')
    
    v = zeros(population,1);
    for j = 1:population
        v(j) = population+1-j; 
    end
    
    genetic_raffle = repelem(f,v);
    
    first_parent = genetic_raffle(round((size(genetic_raffle,2)-1)*rand(1,1)+1));
    second_parent = first_parent;
    while second_parent == first_parent
        second_parent = genetic_raffle(round((size(genetic_raffle,2)-1)*rand(1,1)+1));
    end
    
end

