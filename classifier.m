%This function returns the accuracy of classification when using a
%chromosome with a value between 0 and 100

function [accuracy] = classifier(chromosome,Xtest,Xtrain,Ytest,Ytrain)
    
    model_select = 2;
    
    vector = find(chromosome(:,1));
    Xtest2 = Xtest(vector,14501:14701);
    Xtrain2 = Xtrain(vector,:);
    Ytest2 = Ytest(14501:14701);

    switch model_select
        case 1
            knn_model = fitcknn(Xtrain2',Ytrain');
            classification = predict(knn_model, Xtest2')';
            test = Ytest2() ~= classification;
        case 2
            svm_model = fitclinear(Xtrain2',Ytrain');
            classification = predict(svm_model, Xtest2')';
            test = Ytest2() ~= classification;
        case 3
            multi_svm_model = fitcecoc(Xtrain2',Ytrain');
            classification = predict(multi_svm_model, Xtest2')';
            test = Ytest2() ~= classification;
    end
    
    accuracy = 100-(100*sum(test)/200);
end