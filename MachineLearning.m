%{
	This script contains methods for machine_learning. It read the X and Y generated by the svm_input_generator and learn from the
	training set and output the precision, recall and f1 score. 
%}



cd('/home/basil/Desktop/Google_Drive/Personal_Projects/BTP-KinshipVerification');

load('machine_learning_input.mat') ;

%% X and Y will be in the memory now.

total_data_count=size(final_X,1);
input_vector_size=size(final_X,2);

disp(strcat('Total database_size :: ',num2str(total_data_count)));

rand_row=randperm(size(final_X,1));

X_randomised=final_X(rand_row,:);
Y_randomised=final_Y(rand_row,:);

data_base_division_fraction=.6; % percentage of total data which should be used for training

training_data_size=total_data_count*data_base_division_fraction;


X_training=X_randomised(1:training_data_size,:);
Y_training=Y_randomised(1:training_data_size,:);

disp(strcat('Training data set size :: ',num2str(training_data_size)));

X_Validation=X_randomised(training_data_size+1:end,:);
Y_Validation=Y_randomised(training_data_size+1:end,:);

SVMModel=fitcsvm(X_training,Y_training,'KernelFunction','gaussian','standardize','true','ClassNames',{0,1});

save('svm_model.mat','SVMModel');

[label,score]=predict(SVMModel,X_Validation);

precision=calculate_precision(label,Y_Validation)*100;
recall=calculate_recall(label,Y_Validation)*100;
f1_score=2*precision*recall/(precision+recall);

disp(strcat('Precision =',num2str(precision)));
disp(strcat('Recall =',num2str(recall)));
disp(strcat('f1_score=',num2str(f1_score)));

