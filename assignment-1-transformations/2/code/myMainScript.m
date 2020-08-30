%% MyMainScript
tic;
%% Your code here
%% Q2 Main Script
%  CS 663: Digital Image Processing, IIT Bombay (Autumn 2020)
%  Aman Kansal, Ansh Khurana, Kushagra Juneja
clc; clear all; close all;
warning('off', 'all');

%% Code for Q2.a
% Statue image
figure;
im2 = imread("../data/statue.png");
title("Original image");
imshow(im2);

figure;
[mask, maskedImage] = myForegroundMask(im2);
title("Mask");
imshow(mask);

figure;
title("Masked image");
imshow(maskedImage);

toc;

%% Code for Q2.b
% Barbara image
figure;
im2 = imread("../data/barbara.png");
title("Original image");
imshow(im2);

% Linear Contrast Stretching
figure;
contrastBarbara = uint8(myLinearContrastStretching(im2)) ;
title("Linear Contrast Stretching");
imshow(contrastBarbara);

toc;

%% Code for Q2. c

image1 = imread('../data/barbara.png');
image2 = imread('../data/TEM.png');
image3 = imread('../data/canyon.png');
image5 = imread('../data/church.png');
image6 = imread('../data/chestXray.png');
image7 = imread('../data/statue.png');
[image7_fg_mask, image7_fg] = myForegroundMask(image7);

figure;
he_image1 = myHE(image1);
title("barbara.png - original");
hold on;
imshow(image1);

figure;
title("barbara.png - histogram equalized");
hold on;
imshow(he_image1);


figure;
he_image2 = myHE(image2);
title("TEM.png - original");
hold on;
imshow(image2);

figure;
title("TEm.png - histogram equalized");
hold on;
imshow(he_image2);

figure;
he_image_3 = zeros(size(image3));
he_image3(:,:,1) = myHE(image3(:,:,1));
he_image3(:,:,2) = myHE(image3(:,:,2));
he_image3(:,:,3) = myHE(image3(:,:,3));
title("canyon.png - original");
hold on;
imshow(image3);

figure;
title("canyon.png - histogram equalized");
hold on;
imshow(he_image3);

figure;
hold on;
he_image_5 = zeros(size(image5));
he_image5(:,:,1) = myHE(image5(:,:,1));
he_image5(:,:,2) = myHE(image5(:,:,2));
he_image5(:,:,3) = myHE(image5(:,:,3));
contrasted_image5 = myLinearContrastStretching(image5);
title("church.png - original");
hold on;
imshow(image5);

figure;
title("church.png - histogram equalized");
hold on;
imshow(he_image5);

figure;
title("church.png - linear contrast stretched");
hold on;
imshow(contrasted_image5);


figure;
he_image6 = myHE(image6);
title("chestXray - original");
hold on;
imshow(image6);

figure;
title("chestXray - original");
hold on;
imshow(he_image6);



figure;
he_image7 = myHE(image7_fg);
title("statue.png (foreground) - original");
hold on;
imshow(image7_fg);

figure;
title("statue.png (foreground) - histogram equalized");
hold on;
imshow(he_image7);



%% 2d.
input_image = imread('../data/retina.png');
reference_image = imread('../data/retinaRef.png');
% Original image
displayImage(input_image, 'original image');
% Reference image
displayImage(reference_image, 'reference image');
% Histogram equalized image
equalized_image = zeros(size(input_image));
equalized_image(:,:,1) = myHE(input_image(:,:,1));
equalized_image(:,:,2) = myHE(input_image(:,:,2));
equalized_image(:,:,3) = myHE(input_image(:,:,3));
displayImage(equalized_image, 'histogram equalized image');
% Histogram matched image
matched_img = myHM(input_image, reference_image);
displayImage(matched_img,  'histogram matched image');
toc;

%% Code for Q2.e - Barbara
image1 = imread('../data/barbara.png');
image2 = imread('../data/TEM.png');
image3 = imread('../data/canyon.png');
image6 = imread('../data/chestXray.png');

clahe_window = 50;
small_clahe_window = 10;
large_clahe_window = 150;
clahe_threshold = 0.014;
small_clahe_threshold = 0.007;

%CLAHE Analysis for barbara.png
figure;
hold on;
clahe_image1 = myCLAHE(image1,clahe_window,clahe_threshold);
title("barbara.png - original");
hold on;
imshow(image1);

figure;
title("barbara.png - CLAHE");
hold on;
imshow(clahe_image1);

figure;
hold on;
small_clahe_image1 = myCLAHE(image1,small_clahe_window,clahe_threshold);
title("barbara.png - CLAHE small window");
hold on;
imshow(small_clahe_image1);

figure;
hold on;
large_clahe_image1 = myCLAHE(image1,large_clahe_window,clahe_threshold);
title("barbara.png - CLAHE large window");
hold on;
imshow(large_clahe_image1);

figure;
hold on;
clahe_image1_small_h = myCLAHE(image1,clahe_window,small_clahe_threshold);
title("barbara.png - CLAHE small threshold");
hold on;
imshow(clahe_image1_small_h);

%% Code for Q2.e - TEM
%CLAHE Analysis for TEM.png
figure;
hold on;
clahe_image2 = myCLAHE(image2,clahe_window,clahe_threshold);
title("TEM.png - original");
hold on;
imshow(image2);

figure;
title("TEM.png - CLAHE");
hold on;
imshow(clahe_image2);

figure;
hold on;
small_clahe_image2 = myCLAHE(image2,small_clahe_window,clahe_threshold);
title("TEM.png - CLAHE small window");
hold on;
imshow(small_clahe_image2);

figure;
hold on;
large_clahe_image2 = myCLAHE(image2,large_clahe_window,clahe_threshold);
title("TEM.png - CLAHE large window");
hold on;
imshow(large_clahe_image2);

figure;
hold on;
clahe_image2_small_h = myCLAHE(image2,clahe_window,small_clahe_threshold);
title("TEM.png - CLAHE small threshold");
hold on;
imshow(clahe_image2_small_h);


%% Code for Q2.e - canyon
%CLAHE Analysis for canyon.png
figure;
hold on;
clahe_image = zeros(size(image3));
for i = 1:3
 clahe_image3(:,:,i) = myCLAHE(image3(:,:,i),clahe_window,clahe_threshold);
end
title("canyon.png - original");
hold on;
imshow(image3);

figure;
title("canyon.png - CLAHE");
hold on;
imshow(clahe_image3);

figure;
hold on;
for i = 1:3
 small_clahe_image3(:,:,i) = myCLAHE(image3(:,:,i),small_clahe_window,clahe_threshold);
end
title("canyon.png - CLAHE small window");
hold on;
imshow(small_clahe_image3);

figure;
hold on;
for i = 1:3
 large_clahe_image3(:,:,i) = myCLAHE(image3(:,:,i),large_clahe_window,clahe_threshold);
end
title("canyon.png - CLAHE large window");
hold on;
imshow(large_clahe_image3);

figure;
hold on;
for i = 1:3
 clahe_image3_small_h(:,:,i) = myCLAHE(image3(:,:,i),clahe_window,small_clahe_threshold);
end
title("canyon.png - CLAHE small threshold");
hold on;
imshow(clahe_image3_small_h);


%% Code for Q2.e - chestXray
%CLAHE Analysis for chestXray.png
figure;
hold on;
clahe_image6 = myCLAHE(image6,clahe_window,clahe_threshold);
title("chestXray.png - original");
hold on;
imshow(image6);

figure;
title("chestXray.png - CLAHE");
hold on;
imshow(clahe_image6);

figure;
hold on;
small_clahe_image6 = myCLAHE(image6,small_clahe_window,clahe_threshold);
title("chestXray.png - CLAHE small window");
hold on;
imshow(small_clahe_image6);

figure;
hold on;
large_clahe_image6 = myCLAHE(image6,large_clahe_window,clahe_threshold);
title("chestXray.png - CLAHE large window");
hold on;
imshow(large_clahe_image6);

figure;
hold on;
clahe_image6_small_h = myCLAHE(image6,clahe_window,small_clahe_threshold);
title("chestXray.png - CLAHE small threshold");
hold on;
imshow(clahe_image6_small_h);

