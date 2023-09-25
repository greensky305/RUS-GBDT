clear
clc

load t5_1to1(1).mat
clear x_test y_test

load TT5.txt
index=[];
x_test = TT5(:,1:end-1);
y_test = TT5(:,end);

[raw_train, col]=size(x);

brtModel = brtTrain(x,y, 8,102, 0.05 )


[raw_test, col_test]=size(x_test);

for i=1:raw_test
        
        output(i) = brtTest(x_test(i,:), brtModel );
        
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