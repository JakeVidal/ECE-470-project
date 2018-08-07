%==========================================================================
% Feature removal classification accuracy function
%==========================================================================

function [accuracy] = classifier(chromosome,Xtest,Xtrain,Ytest,Ytrain)
    
    % selects the classifier to be used for accuracy evaluation
    model_select = 1;
    
    %removes appropriate features from datasets according to the chromosome
    vector = find(chromosome(:,1))';
    Xtest2 = Xtest(:,vector);
    Xtrain2 = Xtrain(:,vector);
    Ytrain2 = categorical(Ytrain.Democrat);
    Ytest2 = categorical(Ytest.Democrat);

    % for each model, train using training dataset then classify using testing dataset
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
    
    % evaluate classification accuracy
    accuracy = 100-(100*sum(test)/568);
end