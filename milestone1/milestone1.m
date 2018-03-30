mdl=fitcnb(bankfull,'y');
CVMdl=crossval(mdl);
kfoldLoss=kfoldLoss(CVMdl);