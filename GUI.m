%==========================================================================
% GUI generation and update function
%==========================================================================

function [population,mutation,fitness_choice] = GUI(task,fitness_result,...
accuracy,features_used,mean_fitness,mean_accuracy,mean_features,generations,...
iteration,population,mutation,fitness_choice)
    
    % create empty first entry for graphs
    fitness_result = [0 fitness_result];
    accuracy = [0 accuracy];
    features_used = [0 features_used];
    mean_fitness = [0 mean_fitness];
    mean_accuracy = [0 mean_accuracy];
    mean_features = [0 mean_features];

    % GUI can either initialize the interface or update with current results
    switch task
        case 'initialize'
            
            % generate the figure and name it
            f = figure('Units','Normalized','Position',[0.1 0.2 0.8 0.6]);
            f.Name = 'Genetic algorithm';
            
            % generate the control panel and 2D subplots 
            pnl = uipanel('Units','Normalized','Title','Controls','FontSize',...
            12,'Position',[.05 .1 (1/3-0.05) .85]);
        
            subplot(3,3,2);
            plot(0,fitness_result(1),0,mean_fitness(1));
            axis([0 generations 0 1]);
            axis 'auto y'
            xlabel('generations');
            ylabel('fitness');
            
            subplot(3,3,5);
            plot(0,accuracy(1),0,mean_accuracy(1));
            axis([0 generations 0 1]);
            axis 'auto y'
            xlabel('generations');
            ylabel('accuracy');
            
            subplot(3,3,8);
            plot(0,features_used(1),0,mean_features(1));
            axis([0 generations 0 1]);
            axis 'auto y'
            xlabel('generations');
            ylabel('# features');
            
            % generate the 3D surface plot
            subplot(3,3,[3 6 9]);
            [X,Y] = meshgrid(0:1:100);
            Z = fitness_function(X,Y,fitness_choice);
            CO(:,:,1) = ones(100).*linspace(0.8,0.3,100); % red
            CO(:,:,2) = ones(100).*linspace(0,0.8,100); % green
            CO(:,:,3) = ones(100).*linspace(0.2,0,100); % blue
            
            s = surf(X,Y,Z,CO);
            s.EdgeColor = [0.5 0.5 0];
            xlabel('Accuracy');
            ylabel('Features Removed');
            zlabel('Fitness');

            % generate the UI elements
            uicontrol('Units','Normalized','Parent',pnl,'Style','pushbutton',...
            'String','Pause','Position',[0.05 0.7 0.9 0.1],'Callback',@stop_execution);  
            
            uicontrol('Units','Normalized','Parent',pnl,'Style','pushbutton',...
            'String', 'Start','Position',[0.05 0.85 0.9 0.1],'Callback',@start_execution);  
        
            uicontrol('Units','Normalized','Parent',pnl,'Style','text','Position',...
            [0.05 0.6 0.9 0.05],'String','population 10 to 50');
            
            sld = uicontrol('Units','Normalized','Parent',pnl,'Style','slider',...
            'Min',10,'Max',50,'Value',population,'Position',[0.05 0.5 0.9 0.1],'Tag','pop');  
        
            uicontrol('Units','Normalized','Parent',pnl,'Style','text','Position',...
            [0.05 0.4 0.9 0.05],'String','mutation rate 0% to 5%');
            
            uicontrol('Units','Normalized','Parent',pnl,'Style','slider','Min',...
            0,'Max',0.05,'Value',mutation,'Position', [0.05 0.3 0.9 0.1],'Tag','mut');    
        
            pop = uicontrol('Units','Normalized','Parent',pnl,'Style','popup',...
            'String',{'default','simple','complex'},'Position',[0.05 0.15 0.9 0.1],'Tag','sel');
        
            % once the GUI is initialized, wait until user presses 'start' button
            uiwait;
            
            sld.Enable = 'off';
            pop.Enable = 'off';
            
        case 'update'
            
            % update the 2D subplots
            subplot(3,3,2);
            plot(1:iteration,fitness_result(2:iteration+1),1:iteration,mean_fitness(2:iteration+1));
            axis([0 generations 0 1]);
            axis 'auto y'
            xlabel('generations');
            ylabel('fitness');
            
            subplot(3,3,5);
            plot(1:iteration, accuracy(2:iteration+1), 1:iteration, mean_accuracy(2:iteration+1));
            axis([0 generations 0 1]);
            axis 'auto y'
            xlabel('generations');
            ylabel('accuracy');
            
            subplot(3,3,8);
            plot(1:iteration, features_used(2:iteration+1), 1:iteration, mean_features(2:iteration+1));
            axis([0 generations 0 1]);
            axis 'auto y'
            xlabel('generations');
            ylabel('# features');
            
            % update the 3D surface plot
            subplot(3,3,[3 6 9]);
            [X,Y] = meshgrid(0:1:100);
            Z = fitness_function(X,Y,fitness_choice);
            CO(:,:,1) = ones(100).*linspace(0.8,0.3,100); % red
            CO(:,:,2) = ones(100).*linspace(0,0.8,100); % green
            CO(:,:,3) = ones(100).*linspace(0.2,0,100); % blue
            
            s = surf(X,Y,Z,CO);
            s.EdgeColor = [0.5 0.5 0];
            xlabel('Accuracy');
            ylabel('Features Removed');
            zlabel('Fitness');
            
            % scatter plot progress along feature surface
            hold on
            scatter3(accuracy(2:iteration+1),106-features_used(2:iteration+1),fitness_result(2:iteration+1),'k','f');
            hold off    
    end
    
    % callback function used to pause program execution
    function stop_execution(~,~)
        uiwait;
    end
    
    % callback function used to resume program execution
    function start_execution(~,~)
        uiresume;
    end
    
    % set outputs by gathering UI element values
    handle1 = findall(gcf, 'Tag', 'pop');
    handle2 = findall(gcf, 'Tag', 'mut');
    handle3 = findall(gcf, 'Tag', 'sel');
    population = round(handle1.Value);
    mutation = handle2.Value;
    fitness_choice = handle3.String{handle3.Value};
    
    % output all changes to screen
    drawnow
end