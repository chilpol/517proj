% grpMdl = fitrgp(bankfull,'y');
% grpMdl = fitrgp(bank,'y');
% CVMdl=crossval(grpMdl);
% kfoldLoss=kfoldLoss(CVMdl);
% ypred = kfoldPredict(CVMdl);

CVMdl = fitrgp(bank,'y','crossval','on');
L = kfoldLoss(CVMdl,'mode','individual')
% negative log predictiv density 
f = @nlpd;
L_nlpd = kfoldLoss(CVMdl,'mode','individual','lossfun',f)
% L =
% 
%     0.4541
%     0.3436
%     0.3016
%     0.3768
%     0.4288
%     0.3707
%     0.3165
%     0.3662
%     0.3361
%     0.3231
    
CVMdl_exponential = fitrgp(bank,'y','crossval','on','KernelFunction','exponential');
L_exponential = kfoldLoss(CVMdl_exponential,'mode','individual')
L_exponential_nlpd = kfoldLoss(CVMdl_exponential,'mode','individual','lossfun',f)

CVMdl_matern32 = fitrgp(bank,'y','crossval','on','KernelFunction','matern32');
L_matern32 = kfoldLoss(CVMdl_matern32,'mode','individual')
L_matern32_nlpd = kfoldLoss(CVMdl_matern32,'mode','individual','lossfun',f)


% load carsmall
% XX = [Cylinders Displacement Horsepower Weight];
% YY = MPG;
% cvmodel = fitrtree(XX,YY,'crossval','on');
% L = kfoldLoss(cvmodel,'mode','individual')
