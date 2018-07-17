% Program GUI script
% This script will generate a graphical user interface
% Some features of the GUI will include: ability to tweak variables, plots

function GUI(task, fitness_result, accuracy, features_used, generations, iteration)
    
    fitness_result = [0 fitness_result];
    accuracy = [0 accuracy];
    features_used = [369 features_used];

    switch task
        case 'initialize'
            f = figure();
            subplot(3,1,1);
            plot(0, fitness_result(1));
            axis([0 generations 0 6]);
            xlabel('generations');
            ylabel('fitness');
            
            subplot(3,1,2);
            plot(0, accuracy(1));
            axis([0 generations 0 100]);
            xlabel('generations');
            ylabel('accuracy');
            
            subplot(3,1,3);
            plot(0, features_used(1));
            axis([0 generations 0 369]);
            xlabel('generations');
            ylabel('# features');
            
        case 'update'
            subplot(3,1,1);
            plot(0:iteration, fitness_result(1:iteration+1));
            axis([0 generations 0 6]);
            xlabel('generations');
            ylabel('fitness');
            
            subplot(3,1,2);
            plot(0:iteration, accuracy(1:iteration+1));
            axis([0 generations 0 100]);
            xlabel('generations');
            ylabel('accuracy');
            
            subplot(3,1,3);
            plot(0:iteration, features_used(1:iteration+1));
            axis([0 generations 0 369]);
            xlabel('generations');
            ylabel('# features');
    end
    
    drawnow
end