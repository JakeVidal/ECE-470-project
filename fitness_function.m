function [output] = fitness_function(X,Y,selector)
    switch selector
        case 'default'
            output = X;
        case 'simple'
            output = heaviside(X).*(10*(X).^2).*heaviside(Y).*(10*(Y).^2);
        case 'complex'
            output = (100*X.^2 +X.*Y.^2).*(1-sigmf(Y,[.1 100]));
    end
end