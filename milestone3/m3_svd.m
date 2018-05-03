clear;
load boston

scaled_xTr = zscore(xTr);

%% SVD
% Apply dimensionality reduction (SVD)
[U,S,V]=svd(scaled_xTr);
% diff = scaled_xTr - (U*S*V') % Should be really small (like 1.2e-11)
% lambdas = sum(S);
% Run CrossVal again on cleaned up data
CVMdl_DR = fitrlinear(U,yTr,'CrossVal','on');
kfoldLoss=kfoldLoss(CVMdl_DR); % 86.4872 mse

Mdl_svm = fitrsvm(U,yTr);
CVMdl_svm = crossval(Mdl_svm);
foldLoss_svm=kfoldLoss(CVMdl_svm); % 86.3664

%% Train on AV
