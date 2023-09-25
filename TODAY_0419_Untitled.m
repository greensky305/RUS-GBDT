clear
clc

index=[];

[raw_train, col]=size(x);

% y=data_train(:,1);
% x=data_train(:,2:col);
% y=train(:,1); 
% x=train(:,2:col);

brtModel = brtTrain(x,y, 8,102, 0.05 )

% y_test=test(:,1);
% x_test=test(:,2:col);
% y_test=data_test(:,1);
% x_test=data_test(:,2:col);


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
