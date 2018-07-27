% Program GUI script
% This script will generate a graphical user interface
% Some features of the GUI will include: ability to tweak variables, plots

function GUI(task,fitness_result,accuracy,features_used,mean_fitness,mean_accuracy,mean_features,generations,iteration)
    
    fitness_result = [0 fitness_result];
    accuracy = [50 accuracy];
    features_used = [106 features_used];
    
    mean_fitness = [0 mean_fitness];
    mean_accuracy = [50 mean_accuracy];
    mean_features = [106 mean_features];

    switch task
        case 'initialize'
            f = figure();
            
            pnl = uipanel('Title','Controls','FontSize',12,...
            'Position',[.05 .15 .3 .8]);
        
            subplot(3,3,2);
            plot(0, fitness_result(1), 0, mean_fitness(1));
            axis([0 generations 0 1500000]);
            xlabel('generations');
            ylabel('fitness');
            
            subplot(3,3,5);
            plot(0, accuracy(1), 0, mean_accuracy(1));
            axis([0 generations 50 100]);
            xlabel('generations');
            ylabel('accuracy');
            
            subplot(3,3,8);
            plot(0, features_used(1), 0, mean_features(1));
            axis([0 generations 0 106]);
            xlabel('generations');
            ylabel('# features');
            
            subplot(3,3,[3 6 9]);
            [X,Y] = meshgrid(0:1:100);
            Z = (100*X.^2 +X.*Y.^2).*(.5+sigmf(X,[1 60]));
            CO(:,:,1) = ones(100).*linspace(0.8,0.3,100); % red
            CO(:,:,2) = ones(100).*linspace(0,0.8,100); % green
            CO(:,:,3) = ones(100).*linspace(0.2,0,100); % blue
            
            s = surf(X,Y,Z,CO);
            s.EdgeColor = 'none';
            xlabel('Accuracy');
            ylabel('Features Removed');
            zlabel('Fitness');

            btn = uicontrol('Parent', pnl, 'Style', 'pushbutton', 'String', 'Pause',...
            'Position', [20 250 70 20],...
            'Callback', @stop_execution);  
            
            btn2 = uicontrol('Parent', pnl,'Style', 'pushbutton', 'String', 'Start',...
            'Position', [20 280 70 20],...
            'Callback', @start_execution);  
        
            uiwait;
        
        case 'update'
            subplot(3,3,2);
            plot(0:iteration, fitness_result(1:iteration+1), 0:iteration, mean_fitness(1:iteration+1));
            axis([0 generations 0 1500000]);
            xlabel('generations');
            ylabel('fitness');
            
            subplot(3,3,5);
            plot(0:iteration, accuracy(1:iteration+1), 0:iteration, mean_accuracy(1:iteration+1));
            axis([0 generations 50 100]);
            xlabel('generations');
            ylabel('accuracy');
            
            subplot(3,3,8);
            plot(0:iteration, features_used(1:iteration+1), 0:iteration, mean_features(1:iteration+1));
            axis([0 generations 0 106]);
            xlabel('generations');
            ylabel('# features');
            
            subplot(3,3,[3 6 9]);
            [X,Y] = meshgrid(0:1:100);
            Z = (100*X.^2 +X.*Y.^2).*(.5+sigmf(X,[1 60]));
            CO(:,:,1) = ones(100).*linspace(0.8,0.3,100); % red
            CO(:,:,2) = ones(100).*linspace(0,0.8,100); % green
            CO(:,:,3) = ones(100).*linspace(0.2,0,100); % blue
            
            s = surf(X,Y,Z,CO);
            s.EdgeColor = 'none';
            xlabel('Accuracy');
            ylabel('Features Removed');
            zlabel('Fitness');
            
            hold on
            scatter3(accuracy(2:iteration+1),106-features_used(2:iteration+1),fitness_result(2:iteration+1), 'k', 'f');
            hold off
    end
    
    function stop_execution(~,~)
        uiwait;
    end

    function start_execution(~,~)
        uiresume;
    end

    drawnow
end