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

%% 2d.
input_image = imread('../data/retina.png');
reference_image = imread('../data/retinaRef.png');
% Original image
displayImage(input_image, 'original image');
% Reference image
displayImage(reference_image, 'reference image');
% Histogram equalized image
% equalized_image = get_equalized_image()
% image(cdf_image);
% Histogram matched image
matched_img = myHM(input_image, reference_image);
displayImage(matched_img,  'HM matched image');
toc;