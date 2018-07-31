%This function returns the accuracy of classification when using a
%chromosome with a value between 0 and 100

function [accuracy] = classifier(chromosome,Xtest,Xtrain,Ytest,Ytrain)
    
    model_select = 1;
    
    vector = find(chromosome(:,1))';
    Xtest2 = Xtest(:,vector);
    Xtrain2 = Xtrain(:,vector);
    Ytrain2 = categorical(Ytrain.Democrat);
    Ytest2 = categorical(Ytest.Democrat);

    switch model_select
        case 1
            knn_model = fitcknn(Xtrain2,Ytrain2);
            classification = predict(knn_model, Xtest2);
            test = Ytest2() ~= classification;
        case 2
            svm_model = fitcsvm(Xtrain2,Ytrain2);
            classification = predict(svm_model, Xtest2);
            test = Ytest2() ~= classification;
        case 3
            tree_model = fitctree(Xtrain2,Ytrain2);
            classification = predict(tree_model, Xtest2);
            test = Ytest2() ~= classification;
        case 4
            bayes_model = fitcnb(Xtrain2,Ytrain2);
            classification = predict(bayes_model, Xtest2);
            test = Ytest2() ~= classification;            
    end
    
    accuracy = 100-(100*sum(test)/568);
end