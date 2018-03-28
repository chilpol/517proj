# Milestone 2 Writeup	

## How I used Gaussian Process Regression for Classification

Since GPR is used for regression tasks, my loss calculation translate the predictions into binary classification and calculate the error from there. Since the labels are +1 and -1, the result 


## Raw data
Loss_squaredexponential = [0.154867256637168;0.112582781456954;0.101769911504425;0.117256637168142;0.137168141592920;0.128318584070796;0.099557522123894;0.132743362831858;0.112831858407080;0.103982300884956]
Loss_matern32=[0.119469026548673;0.134657836644592;0.112831858407080;0.117256637168142;0.128318584070796;0.115044247787611;0.130530973451327;0.130530973451327;0.110619469026549;0.117256637168142]
Loss_exponential=[0.139380530973451;0.130242825607064;0.126106194690266;0.090707964601770;0.130530973451327;0.121681415929204;0.117256637168142;0.095132743362832;0.130530973451327;0.143805309734513]

[h,p]=ttest(L_nlpd,L_matern32_nlpd)
h = 0
p = 0.8027
[h,p]=ttest(L_nlpd,L_exponential_nlpd)
h = 0
p = 0.7631
[h,p]=ttest(L_matern32_nlpd,L_exponential_nlpd)
h = 0
p = 0.8955
[p,h]=signtest(L_nlpd,L_matern32_nlpd)
p = 1
h = 0
[p,h]=signtest(L_nlpd,L_exponential_nlpd)
p = 1
h = 0
[p,h]=signtest(L_matern32_nlpd,L_exponential_nlpd)
p = 0.7539
h = 0
