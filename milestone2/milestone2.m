CVMdl = fitrgp(bank,'y','crossval','on');
L = kfoldLoss(CVMdl,'mode','individual')
% 01 loss 
f = @nlpd;
L_nlpd = kfoldLoss(CVMdl,'mode','individual','lossfun',f)

    
CVMdl_exponential = fitrgp(bank,'y','crossval','on','KernelFunction','exponential');
L_exponential = kfoldLoss(CVMdl_exponential,'mode','individual')
L_exponential_nlpd = kfoldLoss(CVMdl_exponential,'mode','individual','lossfun',f)

CVMdl_matern32 = fitrgp(bank,'y','crossval','on','KernelFunction','matern32');
L_matern32 = kfoldLoss(CVMdl_matern32,'mode','individual')
L_matern32_nlpd = kfoldLoss(CVMdl_matern32,'mode','individual','lossfun',f)

