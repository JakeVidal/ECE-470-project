function [output] = fitness_function(X,Y,selector)
    switch selector
        case 'default'
            output = X;
        case 'simple'
            output = heaviside(X).*(10*(X).^2).*heaviside(Y).*(10*(Y).^2);
        case 'complex'
            output = (100*X.^2 +X.*Y.^2).*(.5+sigmf(X,[1 55]));
    end
end