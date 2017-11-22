%{
	This contain the function which will take an RGB image and the bounding box of facial features as input and calculate the Y
	in the Layer two description. Please contact the developer for further knowledge about layer two until proper documentation is build

%}


function output=calculateYforImage(RGB_image,bounding_box);

gray_image=rgb2gray(RGB_image);

test_image=gray_image(10:40,10:40)

[HOG, Visual]=extractHOGFeatures(test_image,'CellSize',[1 1]);

figure;
imshow(test_image);
hold on;
plot(Visual);

size(HOG)
end