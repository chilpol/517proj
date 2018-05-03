clear;
load boston

scaled_xTr = zscore(xTr);
%% PCA
% Apply dimensionality reduction (PCA)
[coeff,score,latent,tsquared,explained] = pca(scaled_xTr,'NumComponents',8);

% run rlinear fit
CVMdl_PCA = fitrlinear(score,yTr,'CrossVal','on');
kfoldLoss=kfoldLoss(CVMdl_PCA); % 26.9188 mse
% [27.463550900938074;35.563727021975530;21.391034987994946;14.711966653163513;18.422471684879880;18.997814796182414;25.928738408426560;35.015971768216110;25.530965245295466;48.335078562589210]
% run svm fit
Mdl_svm = fitrsvm(score,yTr);
CVMdl_svm = crossval(Mdl_svm);
kfoldLoss_svm=kfoldLoss(CVMdl_svm); % 27.3230 mse
% [15.333201123981867;26.536025630247586;58.695366704673070;17.816867678785680;19.871574558074800;58.378911045238915;13.201550830361642;17.801241928746250;19.483859132031082;20.286416709028290]
%% With 4 components mse=31.8577

