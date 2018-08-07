%==========================================================================
% Genetic algorithm function
%==========================================================================

function [new_chromosomes,fitness,accuracy,features_used] = genetic(chromosomes,...
num_features,population,crossover_rate,mutation_rate,Xtrain,Xtest,Ytrain,Ytest,fitness_select)

    % preallocation of arrays to hold results
    fitness = zeros(1,population);
    accuracy = zeros(1,population);
    features_used = zeros(1,population);
    
    % parallel computation loop to increase speed of fitness evaluation
    parfor i = 1:population
        
        % calculate features used and classification accuracy of each chromosome
        features_used(i) = sum(chromosomes(:,i));
        accuracy(i) = classifier(chromosomes(:,i),Xtest,Xtrain,Ytest,Ytrain);
        
        % evaluate fitness function
        X = accuracy(i);
        Y = 100*(num_features - features_used(i))/num_features;
        fitness(i) = fitness_function(X,Y,fitness_select);
    end    
    
    % sort the chromosomes according to fitness
    [~,f] = sort(fitness,'descend');
    
    % create a raffle, more tickets for chromosomes with higher fitness
    v = zeros(population,1);
    for j = 1:population
        
        % exponentially fewer tickets per rank in fitness down to zero
        v(j) = round(population/(2*j)); 
    end
    genetic_raffle = repelem(f,v);
    
    % loop to generate new population of chromosomes randomly
    new_chromosomes = zeros(num_features,population);
    for k = 1:population
        
        % two different parents are randomly selected from the raffle draw
        first_parent = genetic_raffle(round((size(genetic_raffle,2)-1)*rand(1,1)+1));
        second_parent = first_parent;
        while second_parent == first_parent
            second_parent = genetic_raffle(round((size(genetic_raffle,2)-1)*rand(1,1)+1));
        end
        
        % crossover and mutation is performed
        new_chromosomes(:,k) = chromosomes(:,first_parent);
        for m = 1:num_features
            
            % each gene is chosen by chance from one parent
            if rand(1,1) >= crossover_rate
                new_chromosomes(m,k) = chromosomes(m,second_parent);
            end
            
            % each gene then has a chance to mutate by changing its value
            if rand(1,1) <= mutation_rate
                new_chromosomes(m,k) = ~new_chromosomes(m,k);
            end
        end
    end
end
