Loss_squaredexponential = [0.115461181154612;0.115435647943388;0.115461181154612;0.121433311214333;0.117673081176731;0.116788321167883;0.122981641229816;0.112585711125857;0.117230701172307;0.113028091130281];
Loss_matern32=[0.105286441052864;0.119195046439628;0.107055961070560;0.115461181154612;0.115461181154612;0.115903561159036;0.117009511170095;0.118336651183367;0.115903561159036;0.112806901128069];
Loss_exponential=[0.108383101083831;0.108359133126935;0.105065251050653;0.109710241097102;0.114797611147976;0.116124751161248;0.117673081176731;0.113691661136917;0.121875691218757;0.112143331121433];
kfoldLoss_nb=[0.116124751161201;0.117868199911490;0.128953771289481;0.125635921256304;0.133819951338142;0.126741871267363;0.122981641229764;0.120769741207647;0.115018801150138;0.124751161247462];
kfoldLoss_dt=[0.095111700951153;0.097523219814275;0.096881220968846;0.100862641008659;0.103959301039628;0.106834771068384;0.097987170979909;0.100199071002029;0.097987170979907;0.101526211015300];
%% Do NB and DT have the same performance?
[h,p]=ttest(kfoldLoss_nb,kfoldLoss_dt); % h=1; p=7.200899446061739e-08
% The answer is no. DT performs better overall

%% Is DT different than GP ?
[h,p]=ttest(Loss_squaredexponential,kfoldLoss_dt); %h=1;p=1.4619e-06
[h,p]=ttest(Loss_matern32,kfoldLoss_dt); %h=1;p=3.374130805462219e-06
[h,p]=ttest(Loss_exponential,kfoldLoss_dt); %h=1;p=2.170843099048891e-05
% The answer is yes.

%% Is NB better than any GP methods ?
[h,p]=ttest(Loss_squaredexponential,kfoldLoss_nb); %h=1;p=0.010186776596727
[h,p]=ttest(Loss_matern32,kfoldLoss_nb); %h=1;p=0.004711497599732
[h,p]=ttest(Loss_exponential,kfoldLoss_nb); %h=1;p=0.003358588504126
% The answer is yes.

%% Do GP performs differently on different kernel?
[h,p]=ttest(Loss_squaredexponential,L_matern32); %h=0;p=0.1463
[h,p]=ttest(Loss_squaredexponential,Loss_exponential); %h=1;p=0.0371
[h,p]=ttest(L_matern32,Loss_exponential); %h=0;p = 0.3546
[p,h]=signtest(Loss_squaredexponential,Loss_matern32); %h = 0; p = 0.1094
[p,h]=signtest(Loss_squaredexponential,Loss_exponential); % h = 0;p = 0.1094
[p,h]=signtest(Loss_matern32,Loss_exponential); %h = 0; p = 0.7539
% The answer is no.

%% Plotting
boxplot([Loss_squaredexponential,kfoldLoss_dt,kfoldLoss_nb],'label',{'GP','DT','NB'});
title('10-Fold Cross Validation Loss (GP vs. DT vs. NB)');
xlabel('Machine Learning Method');
ylabel('Loss');

boxplot([Loss_squaredexponential,Loss_matern32,Loss_exponential],'label',{'SE','M32','E'});
title('10-Fold Cross Validation Loss (GP vs. DT vs. NB)');
xlabel('Machine Learning Method');
ylabel('Loss');