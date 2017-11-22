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

base_output_image_path='/home/basil/Desktop/Google_Drive/Personal_Projects/BTP-KinshipVerification/image_db'

rmdir(base_output_image_path,'s')

mkdir(base_output_image_path)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Manging the Database 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pause on;

%%%%%%%%%%%%Father -SON


face_part_matrix=[];

cd(db1_fs_dir);
size1=size(dir ('*.jpg'))/2;
file_list=dir('*.jpg');

file_list_to_save={};

disp('In Database 1');
disp('Father-Son database');

for i=1:size1(1) % buffer bug check

	%% For debugging
	%{ 
	if i==10
		break
	end
	%}

	disp(strcat('Reading image   ',file_list(2*i-1).name,' && ',file_list(2*i).name,' :: '));

	img1=imread(file_list(2*i-1).name);
	img2=imread(file_list(2*i).name);
	
	detector = buildDetector();

	tmp_vector1=[]; % possible warning
	tmp_vector2=[];

	[bbbox bbimg1] = detectFaceParts(detector,img1);

	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i-1).name, ' :: '));		
		continue;
	end 
	
	tmp_vector1=bbbox(1,5:20);

	[bbbox bbimg2] = detectFaceParts(detector,img2);


	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i).name,' :: '));		
		continue;
	end 

	tmp_vector2=bbbox(1,5:20);

	face_part_matrix=[face_part_matrix;tmp_vector1,tmp_vector2]; %% Possible warning image1 count,image2 count, vector1, vector2 of currently 16 size each
	file_list_to_save=[file_list_to_save;{file_list(2*i-1).name,file_list(2*i).name}]; %% Possible errors
	imwrite(bbimg1,strcat(base_output_image_path,'/db1_',file_list(2*i-1).name))
	imwrite(bbimg2,strcat(base_output_image_path,'/db1_',file_list(2*i).name))

	disp('Calculated and added to the matrix ');
end


disp('writing the matrix into file db1_fs.mat');

cd(db1_dir);

save('db1_fs.mat','face_part_matrix','file_list_to_save');


%%%%%%%%%%%%For father daughter%%%%%%%%%%%%%%%%%5

face_part_matrix=[];

cd(db1_fd_dir);
size1=size(dir ('*.jpg'))/2;
file_list=dir('*.jpg');

file_list_to_save={};

disp('In Database 1');
disp('Father-Daughter database');

for i=1:size1(1) % buffer bug check

	%% For debugging
	%{ 
	if i==10
		break
	end
	%}

	disp(strcat('Reading image   ',file_list(2*i-1).name,' && ',file_list(2*i).name,' :: '));

	img1=imread(file_list(2*i-1).name);
	img2=imread(file_list(2*i).name);
	
	detector = buildDetector();

	tmp_vector1=[]; % possible warning
	tmp_vector2=[];

	[bbbox bbimg1] = detectFaceParts(detector,img1);

	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i-1).name, ' :: '));		
		continue;
	end 
	
	tmp_vector1=bbbox(1,5:20);

	[bbbox bbimg2] = detectFaceParts(detector,img2);


	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i).name,' :: '));		
		continue;
	end 

	tmp_vector2=bbbox(1,5:20);

	face_part_matrix=[face_part_matrix;tmp_vector1,tmp_vector2]; %% Possible warning image1 count,image2 count, vector1, vector2 of currently 16 size each
	file_list_to_save=[file_list_to_save;{file_list(2*i-1).name,file_list(2*i).name}]; %% Possible errors
	imwrite(bbimg1,strcat(base_output_image_path,'/db1_',file_list(2*i-1).name))
	imwrite(bbimg2,strcat(base_output_image_path,'/db1_',file_list(2*i).name))

	
	disp('Calculated and added to the matrix ');
end


disp('writing the matrix into file db1_fs.mat');

cd(db1_dir);

save('db1_fd.mat','face_part_matrix','file_list_to_save');



%%%%%%%%%Mother - Son 

face_part_matrix=[];

cd(db1_ms_dir);
size1=size(dir ('*.jpg'))/2;
file_list=dir('*.jpg');

file_list_to_save={};

disp('In Database 1');
disp('Mother-Son database');

for i=1:size1(1) % buffer bug check

	%% For debugging
	%{ 
	if i==10
		break
	end
	%}

	disp(strcat('Reading image   ',file_list(2*i-1).name,' && ',file_list(2*i).name,' :: '));

	img1=imread(file_list(2*i-1).name);
	img2=imread(file_list(2*i).name);
	
	detector = buildDetector();

	tmp_vector1=[]; % possible warning
	tmp_vector2=[];

	[bbbox bbimg1] = detectFaceParts(detector,img1);

	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i-1).name, ' :: '));		
		continue;
	end 
	
	tmp_vector1=bbbox(1,5:20);

	[bbbox bbimg2] = detectFaceParts(detector,img2);


	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i).name,' :: '));		
		continue;
	end 

	tmp_vector2=bbbox(1,5:20);

	face_part_matrix=[face_part_matrix;tmp_vector1,tmp_vector2]; %% Possible warning image1 count,image2 count, vector1, vector2 of currently 16 size each
	file_list_to_save=[file_list_to_save;{file_list(2*i-1).name,file_list(2*i).name}]; %% Possible errors
	imwrite(bbimg1,strcat(base_output_image_path,'/db1_',file_list(2*i-1).name))
	imwrite(bbimg2,strcat(base_output_image_path,'/db1_',file_list(2*i).name))

	
	disp('Calculated and added to the matrix ');
end


disp('writing the matrix into file db1_fs.mat');

cd(db1_dir);

save('db1_ms.mat','face_part_matrix','file_list_to_save');



%%%%%%%%%%%%%%%%Mother-Daughter database--------------------------------


face_part_matrix=[];

cd(db1_fs_dir);
size1=size(dir ('*.jpg'))/2;
file_list=dir('*.jpg');

file_list_to_save={};

disp('In Database 1');
disp('Mother Daughter database');

for i=1:size1(1) % buffer bug check

	%% For debugging
	%{ 
	if i==10
		break
	end
	%}

	disp(strcat('Reading image   ',file_list(2*i-1).name,' && ',file_list(2*i).name,' :: '));

	img1=imread(file_list(2*i-1).name);
	img2=imread(file_list(2*i).name);
	
	detector = buildDetector();

	tmp_vector1=[]; % possible warning
	tmp_vector2=[];

	[bbbox bbimg1] = detectFaceParts(detector,img1);

	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i-1).name, ' :: '));		
		continue;
	end 
	
	tmp_vector1=bbbox(1,5:20);

	[bbbox bbimg2] = detectFaceParts(detector,img2);


	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i).name,' :: '));		
		continue;
	end 

	tmp_vector2=bbbox(1,5:20);

	face_part_matrix=[face_part_matrix;tmp_vector1,tmp_vector2]; %% Possible warning image1 count,image2 count, vector1, vector2 of currently 16 size each
	file_list_to_save=[file_list_to_save;{file_list(2*i-1).name,file_list(2*i).name}]; %% Possible errors
	imwrite(bbimg1,strcat(base_output_image_path,'/db1_',file_list(2*i-1).name))
	imwrite(bbimg2,strcat(base_output_image_path,'/db1_',file_list(2*i).name))

	
	disp('Calculated and added to the matrix ');
end


disp('writing the matrix into file db1_fs.mat');

cd(db1_dir);

save('db1_md.mat','face_part_matrix','file_list_to_save');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Manging the Database 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%Father -SON


face_part_matrix=[];

cd(db2_fs_dir);
size1=size(dir ('*.jpg'))/2;
file_list=dir('*.jpg');

file_list_to_save={};

disp('In Database 2');
disp('Father-Son database');

for i=1:size1(1) % buffer bug check

	%% For debugging
	%{ 
	if i==10
		break
	end
	%}

	disp(strcat('Reading image   ',file_list(2*i-1).name,' && ',file_list(2*i).name,' :: '));

	img1=imread(file_list(2*i-1).name);
	img2=imread(file_list(2*i).name);
	
	detector = buildDetector();

	tmp_vector1=[]; % possible warning
	tmp_vector2=[];

	[bbbox bbimg1] = detectFaceParts(detector,img1);

	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i-1).name, ' :: '));		
		continue;
	end 
	
	tmp_vector1=bbbox(1,5:20);

	[bbbox bbimg2] = detectFaceParts(detector,img2);


	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i).name,' :: '));		
		continue;
	end 

	tmp_vector2=bbbox(1,5:20);

	face_part_matrix=[face_part_matrix;tmp_vector1,tmp_vector2]; %% Possible warning image1 count,image2 count, vector1, vector2 of currently 16 size each
	file_list_to_save=[file_list_to_save;{file_list(2*i-1).name,file_list(2*i).name}]; %% Possible errors
	imwrite(bbimg1,strcat(base_output_image_path,'/db2_',file_list(2*i-1).name))
	imwrite(bbimg2,strcat(base_output_image_path,'/db2_',file_list(2*i).name))

	
	disp('Calculated and added to the matrix ');
end


disp('writing the matrix into file db2_fs.mat');

cd(db2_dir);

save('db2_fs.mat','face_part_matrix','file_list_to_save');


%%%%%%%%%%%%For father daughter%%%%%%%%%%%%%%%%%5

face_part_matrix=[];

cd(db2_fd_dir);
size1=size(dir ('*.jpg'))/2;
file_list=dir('*.jpg');

file_list_to_save={};

disp('In Database 2');
disp('Father-Daughter database');

for i=1:size1(1) % buffer bug check

	%% For debugging
	%{ 
	if i==10
		break
	end
	%}

	disp(strcat('Reading image   ',file_list(2*i-1).name,' && ',file_list(2*i).name,' :: '));

	img1=imread(file_list(2*i-1).name);
	img2=imread(file_list(2*i).name);
	
	detector = buildDetector();

	tmp_vector1=[]; % possible warning
	tmp_vector2=[];

	[bbbox bbimg1] = detectFaceParts(detector,img1);

	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i-1).name, ' :: '));		
		continue;
	end 
	
	tmp_vector1=bbbox(1,5:20);

	[bbbox bbimg2] = detectFaceParts(detector,img2);


	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i).name,' :: '));		
		continue;
	end 

	tmp_vector2=bbbox(1,5:20);

	face_part_matrix=[face_part_matrix;tmp_vector1,tmp_vector2]; %% Possible warning image1 count,image2 count, vector1, vector2 of currently 16 size each
	file_list_to_save=[file_list_to_save;{file_list(2*i-1).name,file_list(2*i).name}]; %% Possible errors
	imwrite(bbimg1,strcat(base_output_image_path,'/db2_',file_list(2*i-1).name))
	imwrite(bbimg2,strcat(base_output_image_path,'/db2_',file_list(2*i).name))

	
	disp('Calculated and added to the matrix ');
end


disp('writing the matrix into file db2_fd.mat');

cd(db2_dir);

save('db2_fd.mat','face_part_matrix','file_list_to_save');



%%%%%%%%%Mother - Son 

face_part_matrix=[];

cd(db2_ms_dir);
size1=size(dir ('*.jpg'))/2;
file_list=dir('*.jpg');

file_list_to_save={};

disp('In Database 2');
disp('Mother-Son database');

for i=1:size1(1) % buffer bug check

	%% For debugging
	%{ 
	if i==10
		break
	end
	%}

	disp(strcat('Reading image   ',file_list(2*i-1).name,' && ',file_list(2*i).name,' :: '));

	img1=imread(file_list(2*i-1).name);
	img2=imread(file_list(2*i).name);
	
	detector = buildDetector();

	tmp_vector1=[]; % possible warning
	tmp_vector2=[];

	[bbbox bbimg1] = detectFaceParts(detector,img1);

	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i-1).name, ' :: '));		
		continue;
	end 
	
	tmp_vector1=bbbox(1,5:20);

	[bbbox bbimg2] = detectFaceParts(detector,img2);


	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i).name,' :: '));		
		continue;
	end 

	tmp_vector2=bbbox(1,5:20);

	face_part_matrix=[face_part_matrix;tmp_vector1,tmp_vector2]; %% Possible warning image1 count,image2 count, vector1, vector2 of currently 16 size each
	file_list_to_save=[file_list_to_save;{file_list(2*i-1).name,file_list(2*i).name}]; %% Possible errors
	imwrite(bbimg1,strcat(base_output_image_path,'/db2_',file_list(2*i-1).name))
	imwrite(bbimg2,strcat(base_output_image_path,'/db2_',file_list(2*i).name))

	
	disp('Calculated and added to the matrix ');
end


disp('writing the matrix into file db2_ms.mat');

cd(db2_dir);

save('db2_ms.mat','face_part_matrix','file_list_to_save');



%%%%%%%%%%%%%%%%Mother-Daughter database--------------------------------


face_part_matrix=[];

cd(db2_md_dir);
size1=size(dir ('*.jpg'))/2;
file_list=dir('*.jpg');

file_list_to_save={};

disp('In Database 2');
disp('Mother Daughter database');

for i=1:size1(1) % buffer bug check

	%% For debugging
	%{ 
	if i==10
		break
	end
	%}

	disp(strcat('Reading image   ',file_list(2*i-1).name,' && ',file_list(2*i).name,' :: '));

	img1=imread(file_list(2*i-1).name);
	img2=imread(file_list(2*i).name);
	
	detector = buildDetector();

	tmp_vector1=[]; % possible warning
	tmp_vector2=[];

	[bbbox bbimg1] = detectFaceParts(detector,img1);

	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i-1).name, ' :: '));		
		continue;
	end 
	
	tmp_vector1=bbbox(1,5:20);

	[bbbox bbimg2] = detectFaceParts(detector,img2);


	if length(bbbox)==0

		disp(strcat('The output vector was null in ---------------------------------------> ',file_list(2*i).name,' :: '));		
		continue;
	end 

	tmp_vector2=bbbox(1,5:20);

	face_part_matrix=[face_part_matrix;tmp_vector1,tmp_vector2]; %% Possible warning image1 count,image2 count, vector1, vector2 of currently 16 size each
	file_list_to_save=[file_list_to_save;{file_list(2*i-1).name,file_list(2*i).name}]; %% Possible errors
	imwrite(bbimg1,strcat(base_output_image_path,'/db2_',file_list(2*i-1).name))
	imwrite(bbimg2,strcat(base_output_image_path,'/db2_',file_list(2*i).name))
	
	disp('Calculated and added to the matrix ');
end


disp('writing the matrix into file db2_md.mat');

cd(db2_dir);

save('db2_md.mat','face_part_matrix','file_list_to_save');


