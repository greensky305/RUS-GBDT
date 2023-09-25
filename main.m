clear
clc


 load data_listed_T1_31.mat

 data=cell2mat(TEST_1to1(1));

index=[];

grp=data(:,end);
obs=data(:,1:end-1);
cvp1 = cvpartition(grp,'holdout',0.2);  
x = obs(cvp1.training,:);
y = grp(cvp1.training,:);
x_test  = obs(cvp1.test,:);
y_test  = grp(cvp1.test,:);  


save t1_1to1.mat x y x_test y_test

[raw_train, col]=size(x);

brtModel = brtTrain(x,y, 8, 102, 0.05 )

[raw_test, col_test]=size(x_test);

for i=1:raw_test
        
        output(i) = brtTest( x_test(i,:), brtModel );
        
end

for i=1:raw_test
        if    output(i) >=0.5
                
                output1(i)=1;
        else
                
                output1(i)=0;
                
        end
end
output2=output1';
acc=1-sum(abs(y_test-output2))/raw_test;
auc=AUC(y_test,output2);
[X0,Y0,~,AUC_GB] =perfcurve(y_test,output2,1);
AUC_GB
confusionmatrix = confusionmat(y_test,output2);