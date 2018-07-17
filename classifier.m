%This function returns the accuracy of classification when using a
%chromosome with a value between 0 and 100

function [accuracy] = classifier(chromosome,Xtest,Xtrain,Ytest,Ytrain)

    vector = find(chromosome(:,1));
    
    Xtest2 = Xtest(vector,:);
    Xtrain2 = Xtrain(vector,:);
    
    class = Ytest();
    for i = 14501:14701
        temp = KNN(Xtest2(:,i),Xtrain2,Ytrain,7);
        if Ytest(i) ~= temp
            class(i) = 0;
        else
            class(i) = 1;
        end
    end
    
    accuracy = 100*sum(class(14501:14701))/200;
end