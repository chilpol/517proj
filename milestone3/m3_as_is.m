load boston

%% No Dimensionality Reduction
% Run CrossVal on xTr and yTr before dimensionality reduction
CVMdl = fitrlinear(xTr,yTr,'CrossVal','on');
kfoldLoss=kfoldLoss(CVMdl); % 68.2391 mse

Mdl_svm = fitrsvm(xTr,yTr);
CVMdl_svm = crossval(Mdl_svm);
kfoldLoss_svm=kfoldLoss(CVMdl_svm); % 26.1266