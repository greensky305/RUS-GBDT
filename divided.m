 
%  load T_41.txt
 %load T1_41.txt
% load T4_41.txt
T1_31 = xlsread('E:\data.xlsx');


 default=T1_31(2821:end,:);
 non_default=T1_31(1:2820,:);

[raw_data, col_data] = size(default);


% 1:1
indices = crossvalind('Kfold',non_default(:,end),6);

one_to_one=zeros(raw_data*2,col_data);
one_to_one(1:raw_data,:)=default;
TEST_1to1={};
for i=1:6
Test = (indices == i);
test = non_default(Test,:);
one_to_one(raw_data+1:raw_data*2,:)=test(1:raw_data,:);
TEST_1to1(i) = {one_to_one}; 
end

% 1:2
indices = crossvalind('Kfold',non_default(:,end),3);

one_to_two=zeros(raw_data*3,col_data);
one_to_two(1:raw_data,:)=default;
TEST_1to2={};
for i=1:3
Test = (indices == i);
test = non_default(Test,:);
one_to_two(raw_data+1:raw_data*3,:)=test(1:raw_data*2,:);
TEST_1to2(i) = {one_to_two}; 
end

% 1:3
indices = crossvalind('Kfold',non_default(:,end),2);

one_to_three=zeros(raw_data*4,col_data);
one_to_three(1:raw_data,:)=default;
TEST_1to3={};
for i=1:2
Test = (indices == i);
test = non_default(Test,:);
one_to_three(raw_data+1:raw_data*4,:)=test(1:raw_data*3,:);
TEST_1to3(i) = {one_to_three}; 
end

% 1:4
indices = crossvalind('Kfold',non_default(:,end),1);

one_to_four=zeros(raw_data*5,col_data);
one_to_four(1:raw_data,:)=default;
TEST_1to4={};
Test = (indices == 1);
test = non_default(Test,:);
one_to_four(raw_data+1:raw_data*5,:)=test(1:raw_data*4,:);
TEST_1to4 = {one_to_four}; 

% 1:5
indices = crossvalind('Kfold',non_default(:,end),1);

one_to_five=zeros(raw_data*6,col_data);
one_to_five(1:raw_data,:)=default;
TEST_1to5={};
Test = (indices == 1);
test = non_default(Test,:);
one_to_five(raw_data+1:raw_data*6,:)=test(1:raw_data*5,:);
TEST_1to5 = {one_to_five}; 

% 1:6
indices = crossvalind('Kfold',non_default(:,end),1);

one_to_six=zeros(raw_data*7,col_data);
one_to_six(1:raw_data,:)=default;
TEST_1to6={};
Test = (indices == 1);
test = non_default(Test,:);
one_to_six(raw_data+1:raw_data*7,:)=test(1:raw_data*6,:);
TEST_1to6 = {one_to_six}; 



%   save data_listed_T_41.mat TEST_1to1 TEST_1to2 TEST_1to3 TEST_1to4 TEST_1to5 TEST_1to6
 save data_listed_T1_31.mat TEST_1to1 TEST_1to2 TEST_1to3 TEST_1to4 TEST_1to5 TEST_1to6
