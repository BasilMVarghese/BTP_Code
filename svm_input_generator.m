%{
	This script will contains methods / program for generating the input vectors of the svm function which will later be used by the 
	script MachineLearning.m 


%}

db1_dir='/home/basil/Desktop/Google_Drive/Personal_Projects/BTP-KinshipVerification/New_database/KinFaceW-I'
db2_dir='/home/basil/Desktop/Google_Drive/Personal_Projects/BTP-KinshipVerification/New_database/KinFaceW-II'
db1_fs_dir='/home/basil/Desktop/Google_Drive/Personal_Projects/BTP-KinshipVerification/New_database/KinFaceW-I/KinFaceW-I/images/father-son'
db1_fd_dir='/home/basil/Desktop/Google_Drive/Personal_Projects/BTP-KinshipVerification/New_database/KinFaceW-I/KinFaceW-I/images/father-dau'
db1_ms_dir='/home/basil/Desktop/Google_Drive/Personal_Projects/BTP-KinshipVerification/New_database/KinFaceW-I/KinFaceW-I/images/mother-son'
db1_md_dir='/home/basil/Desktop/Google_Drive/Personal_Projects/BTP-KinshipVerification/New_database/KinFaceW-I/KinFaceW-I/images/mother-dau'
db2_fs_dir='/home/basil/Desktop/Google_Drive/Personal_Projects/BTP-KinshipVerification/New_database/KinFaceW-II/KinFaceW-II/images/father-son'
db2_fd_dir='/home/basil/Desktop/Google_Drive/Personal_Projects/BTP-KinshipVerification/New_database/KinFaceW-II/KinFaceW-II/images/father-dau'
db2_ms_dir='/home/basil/Desktop/Google_Drive/Personal_Projects/BTP-KinshipVerification/New_database/KinFaceW-II/KinFaceW-II/images/mother-son'
db2_md_dir='/home/basil/Desktop/Google_Drive/Personal_Projects/BTP-KinshipVerification/New_database/KinFaceW-II/KinFaceW-II/images/mother-dau'

clear all;
final_X=[] %% The final input variable for the svm to be created.
final_Y=[] %% The final ouput variable . / Ground truth



%%%%%%%%%%%%%%%%%%%%%for Database 1$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%For father-son%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





cd(db1_dir);

load('db1_fs.mat');

if size(face_part_matrix,1)~=size(file_list_to_save)
	error('The number of image files and image matrix are not eqaul in db1');
end

cd(db1_fs_dir)

for i=1:size(face_part_matrix)

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(i,2));

	V=[1] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,face_part_matrix(i,:));

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;1]
end

%% Negative count generator

negative_perc=.2; %% Should never ever go above .5

negatvie_count=negative_perc*size(face_part_matrix,1)

for i=1:negatvie_count

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(size(face_part_matrix,1)-i,2));

	V=[1] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,[face_part_matrix(i,1:16),face_part_matrix(size(face_part_matrix,1)-i,17:end)]);

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;0]

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%For father-daughter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





cd(db1_dir);

load('db1_fd.mat');

if size(face_part_matrix,1)~=size(file_list_to_save)
	error('The number of image files and image matrix are not eqaul in db1');
end

cd(db1_fd_dir)

for i=1:size(face_part_matrix)

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(i,2));

	V=[2] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,face_part_matrix(i,:));

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;1]
end

%% Negative count generator

negative_perc=.2; %% Should never ever go above .5

negatvie_count=negative_perc*size(face_part_matrix,1)

for i=1:negatvie_count

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(size(face_part_matrix,1)-i,2));

	V=[2] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,[face_part_matrix(i,1:16),face_part_matrix(size(face_part_matrix,1)-i,17:end)]);

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;0]

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%For Mother-son %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





cd(db1_dir);

load('db1_ms.mat');

if size(face_part_matrix,1)~=size(file_list_to_save)
	error('The number of image files and image matrix are not eqaul in db1');
end

cd(db1_ms_dir)

for i=1:size(face_part_matrix)

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(i,2));

	V=[3] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,face_part_matrix(i,:));

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;1]
end

%% Negative count generator

negative_perc=.2; %% Should never ever go above .5

negatvie_count=negative_perc*size(face_part_matrix,1)

for i=1:negatvie_count

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(size(face_part_matrix,1)-i,2));

	V=[3] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,[face_part_matrix(i,1:16),face_part_matrix(size(face_part_matrix,1)-i,17:end)]);

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;0]

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%For Mother Daughter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





cd(db1_dir);

load('db1_md.mat');

if size(face_part_matrix,1)~=size(file_list_to_save)
	error('The number of image files and image matrix are not eqaul in db1');
end

cd(db1_md_dir)

for i=1:size(face_part_matrix)

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(i,2));

	V=[4] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,face_part_matrix(i,:));

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;1]
end

%% Negative count generator

negative_perc=.2; %% Should never ever go above .5

negatvie_count=negative_perc*size(face_part_matrix,1)

for i=1:negatvie_count

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(size(face_part_matrix,1)-i,2));

	V=[4] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,[face_part_matrix(i,1:16),face_part_matrix(size(face_part_matrix,1)-i,17:end)]);

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;0]

end



%%%%%%%%%%%%%%%%%%%%%for Database 2$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%For father-son%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





cd(db2_dir);

load('db2_fs.mat');

if size(face_part_matrix,1)~=size(file_list_to_save)
	error('The number of image files and image matrix are not eqaul in db2');
end

cd(db2_fs_dir)

for i=1:size(face_part_matrix)

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(i,2));

	V=[1] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,face_part_matrix(i,:));

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;1]
end

%% Negative count generator

negative_perc=.2; %% Should never ever go above .5

negatvie_count=negative_perc*size(face_part_matrix,1)

for i=1:negatvie_count

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(size(face_part_matrix,1)-i,2));

	V=[1] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,[face_part_matrix(i,1:16),face_part_matrix(size(face_part_matrix,1)-i,17:end)]);

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;0]

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%For father-daughter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





cd(db2_dir);

load('db2_fd.mat');

if size(face_part_matrix,1)~=size(file_list_to_save)
	error('The number of image files and image matrix are not eqaul in db2');
end

cd(db2_fd_dir)

for i=1:size(face_part_matrix)

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(i,2));

	V=[2] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,face_part_matrix(i,:));

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;1]
end

%% Negative count generator

negative_perc=.2; %% Should never ever go above .5

negatvie_count=negative_perc*size(face_part_matrix,1)

for i=1:negatvie_count

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(size(face_part_matrix,1)-i,2));

	V=[2] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,[face_part_matrix(i,1:16),face_part_matrix(size(face_part_matrix,1)-i,17:end)]);

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;0]

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%For Mother-son %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





cd(db2_dir);

load('db2_ms.mat');

if size(face_part_matrix,1)~=size(file_list_to_save)
	error('The number of image files and image matrix are not eqaul in db2');
end

cd(db2_ms_dir)

for i=1:size(face_part_matrix)

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(i,2));

	V=[3] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,face_part_matrix(i,:));

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;1]
end

%% Negative count generator

negative_perc=.2; %% Should never ever go above .5

negatvie_count=negative_perc*size(face_part_matrix,1)

for i=1:negatvie_count

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(size(face_part_matrix,1)-i,2));

	V=[3] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,[face_part_matrix(i,1:16),face_part_matrix(size(face_part_matrix,1)-i,17:end)]);

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;0]

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%For Mother Daughter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





cd(db2_dir);

load('db2_md.mat');

if size(face_part_matrix,1)~=size(file_list_to_save)
	error('The number of image files and image matrix are not eqaul in db2');
end

cd(db2_md_dir)

for i=1:size(face_part_matrix)

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(i,2));

	V=[4] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,face_part_matrix(i,:));

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;1]
end

%% Negative count generator

negative_perc=.2; %% Should never ever go above .5

negatvie_count=negative_perc*size(face_part_matrix,1)

for i=1:negatvie_count

	img1=imread(file_list_to_save(i,1));
	img2=imread(file_list_to_save(size(face_part_matrix,1)-i,2));

	V=[4] %% Represent only the father-daughter relation
	Z=findZforImages(img1,img2);
	Y=findYforImages(img1,img2,[face_part_matrix(i,1:16),face_part_matrix(size(face_part_matrix,1)-i,17:end)]);

	final_X=[final_X;V,Y,Z]  %% See the layer 1 part 2 documentaion
	final_Y=[final_Y;0]

end




disp(strcat('Total svm imput size is  =',num2str(size(final_X,1))))

disp('Saving all the SVM input Xs and labels')

save('machine_learning_input.mat','final_X','final_Y')