function [return_val] = nlpd(Y,Yfit,W)
% where Y, Yfit, and W are numeric vectors of the same length.
% Y is the observed response.
% Yfit is the predicted response.
% W is the observation weights.
% The returned value fun(Y,Yfit,W) should be a scalar.

indexes_with_valid_preds = find(~isnan(Yfit));
n=length(indexes_with_valid_preds);
Ys = Y(indexes_with_valid_preds);
Yfits = Yfit(indexes_with_valid_preds);
Yfits = sign(Yfits);
return_val = sum(Ys~=Yfits)/n;

end