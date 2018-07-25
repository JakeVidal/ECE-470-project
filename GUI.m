% Program GUI script
% This script will generate a graphical user interface
% Some features of the GUI will include: ability to tweak variables, plots

function GUI(task, fitness_result, accuracy, features_used, generations, iteration)
    
    fitness_result = [0 fitness_result];
    accuracy = [50 accuracy];
    features_used = [106 features_used];

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
            axis([0 generations 50 100]);
            xlabel('generations');
            ylabel('accuracy');
            
            subplot(3,1,3);
            plot(0, features_used(1));
            axis([0 generations 0 106]);
            xlabel('generations');
            ylabel('# features');
            
            btn = uicontrol('Style', 'pushbutton', 'String', 'Pause',...
            'Position', [430 20 70 20],...
            'Callback', @stop_execution);  
            
            btn2 = uicontrol('Style', 'pushbutton', 'String', 'Start',...
            'Position', [80 20 70 20],...
            'Callback', @start_execution);  
        
            uiwait;
        
        case 'update'
            subplot(3,1,1);
            plot(0:iteration, fitness_result(1:iteration+1));
            axis([0 generations 0 6]);
            xlabel('generations');
            ylabel('fitness');
            
            subplot(3,1,2);
            plot(0:iteration, accuracy(1:iteration+1));
            axis([0 generations 50 100]);
            xlabel('generations');
            ylabel('accuracy');
            
            subplot(3,1,3);
            plot(0:iteration, features_used(1:iteration+1));
            axis([0 generations 0 106]);
            xlabel('generations');
            ylabel('# features');
    end
    
    function stop_execution(source,event)
        uiwait;
    end

    function start_execution(source,event)
        uiresume;
    end

    drawnow
end