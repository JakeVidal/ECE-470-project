% Genetic algorithm function
% 1. This function takes an initial population as input
% 2. This function evaluates the fitness of the candidates
% 3. This function selects pairs for generating a new population
% 4. This function breeds the pairs using mutation and crossover
% 5. This function returns the new population

function [new_chromosomes,fitness] = genetic(chromosomes,num_features,population,crossover_rate,mutation_rate,Xtrain,Xtest,Ytrain,Ytest)
    fitness = zeros(1,population);
    parfor i = 1:population
        fitness(i) = classifier(chromosomes(:,i),Xtest,Xtrain,Ytest,Ytrain);
    end    
    
    [~,f] = sort(fitness,'descend');
    
    v = zeros(population,1);
    for j = 1:population
        v(j) = round(population/(2*j)); 
    end
    
    genetic_raffle = repelem(f,v);
    
    new_chromosomes = zeros(num_features,population);
    for k = 1:population
        first_parent = genetic_raffle(round((size(genetic_raffle,2)-1)*rand(1,1)+1));
        second_parent = first_parent;
        while second_parent == first_parent
            second_parent = genetic_raffle(round((size(genetic_raffle,2)-1)*rand(1,1)+1));
        end
        
        new_chromosomes(:,k) = chromosomes(:,first_parent);
        for m = 1:num_features
            if rand(1,1) >= crossover_rate
                new_chromosomes(m,k) = chromosomes(m,second_parent);
            end
            if rand(1,1) <= mutation_rate
                new_chromosomes(m,k) = ~new_chromosomes(m,k);
            end
        end
    end
end
