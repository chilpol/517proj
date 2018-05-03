load boston

%% No Dimensionality Reduction
% Run CrossVal on xTr and yTr before dimensionality reduction
CVMdl = fitrlinear(xTr,yTr,'CrossVal','on');
kfoldLoss=kfoldLoss(CVMdl); % 68.2391 mse

%% No Dimensinality Reduction on standardized data
scaled_xTr = zscore(xTr);
CVMdl_standardized = fitrlinear(scaled_xTr,yTr,'CrossVal','on');
kfoldLoss=kfoldLoss(CVMdl_standardized); % 25.9363 mse

%% SVD
% Apply dimensionality reduction (SVD)
[U,S,V]=svd(scaled_xTr);
% diff = scaled_xTr - (U*S*V') % Should be really small (like 1.2e-11)
lambdas = sum(S);
% Run CrossVal again on cleaned up data
CVMdl_DR = fitrlinear(U,yTr,'CrossVal','on');
kfoldLoss=kfoldLoss(CVMdl_DR); % 86.4872 mse

%% PCA
% Apply dimensionality reduction (PCA)
[coeff,score,latent,tsquared,explained] = pca(scaled_xTr,'NumComponents',8);
CVMdl_PCA = fitrlinear(score,yTr,'CrossVal','on');
kfoldLoss=kfoldLoss(CVMdl_PCA); %


