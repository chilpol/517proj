# Milestone 2 Writeup	

## How I used Gaussian Process Regression for Classification

Since GPR is used for regression tasks, my loss calculation translate the predictions into binary classification and calculate the error from there. Since the labels are +1 and -1, the result 

Kernel chosen: squaredexponential, matern32, and exponential.

Cross Validation: 10-fold

Runtime: 3-4 hours to train a 10-fold cross validation model

## Result:

Overall, the all three kernels have similar performance with exponential kernel performs slightly better than the other two (by 0.20% to 0.40%.)

## Raw data
Loss_squaredexponential = [0.115461181154612;0.115435647943388;0.115461181154612;0.121433311214333;0.117673081176731;0.116788321167883;0.122981641229816;0.112585711125857;0.117230701172307;0.113028091130281]

Loss_matern32=[0.105286441052864;0.119195046439628;0.107055961070560;0.115461181154612;0.115461181154612;0.115903561159036;0.117009511170095;0.118336651183367;0.115903561159036;0.112806901128069]

Loss_exponential=[0.108383101083831;0.108359133126935;0.105065251050653;0.109710241097102;0.114797611147976;0.116124751161248;0.117673081176731;0.113691661136917;0.121875691218757;0.112143331121433]

[h,p]=ttest(L_nlpd,L_matern32_nlpd)

h = 0

p = 0.1463

[h,p]=ttest(L_nlpd,L_exponential_nlpd)

h = 1

p = 0.0371

[h,p]=ttest(L_matern32_nlpd,L_exponential_nlpd)

h = 0

p = 0.3546

[p,h]=signtest(L_nlpd,L_matern32_nlpd)

p = 0.1094

h = 0

[p,h]=signtest(L_nlpd,L_exponential_nlpd)

p = 0.1094

h = 0

[p,h]=signtest(L_matern32_nlpd,L_exponential_nlpd)

p = 0.7539

h = 0
