%{
	This contain the function which will take an RGB image and the bounding box of facial features as input and calculate the Y
	in the Layer two description. Please contact the developer for further knowledge about layer two until proper documentation is build

%}

function output=findYforImages(RGB_image1,RGB_image2,bounding_box);

img1_gray=rgb2gray(RGB_image1);
img2_gray=rgb2gray(RGB_image2);

output=[]

	for i=0:3
		x1_1=bounding_box(1,i*4+1);
		y1_1=bounding_box(1,i*4+2);
		x1_2=bounding_box(1,i*4+3);
		y1_2=bounding_box(1,i*4+4);

		x2_1=bounding_box(1,i*4+17);
		y2_1=bounding_box(1,i*4+18);
		x2_2=bounding_box(1,i*4+19);
		y2_2=bounding_box(1,i*4+20);

		part1=img1_gray(x1_1:x1_2,y1_1:y1_2);
		part2=img2_gray(x2_1:x2_2,y2_1:y2_2);

		part2_resized=imresize(part2,size(part1));

		scr=cal_struct_similarity(part1,part2_resized);

		output=[output,scr]

	end



end
