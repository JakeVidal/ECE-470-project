%==========================================================================
% Fitness selector function
%==========================================================================

function [output] = fitness_function(X,Y,selector)

    % selects the fitness function metric by which to evaluate chromosomes
    switch selector
        case 'default'
            output = X;
        case 'simple'
            output =(10*(X).^2).*(10*(Y).^2);
        case 'complex'
            output = (100*X.^2 +X.*Y.^2).*(.5+sigmf(X,[1 55]));
    end
end