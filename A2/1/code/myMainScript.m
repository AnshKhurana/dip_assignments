%% MyMainScript

tic;
%% Code for Q1
%  CS 663: Digital Image Processing, IIT Bombay (Autumn 2020)
%  Aman Kansal, Ansh Khurana, Kushagra Juneja
%
% LC in the images stands for Linear Contrasted. Standard LC method
% produces slightly dull images (the intensities in the original image
% might already be peaking). Thus we use imadjust method from matlab to
% give better linear contrasted images. It is same as linear contrasting
% except that it chooses appropriate intensities as min and max for linear
% contrasting instead of otiginal min and max
%
% The parameters hsize, sigma and scale for the superMoon and lion images
% in order are - [13, 5, 3] and [12, 4,2] respectively. Note that actual
% dimensions of filter are 2*hsize+1

clc; clear all; close all;
warning('off','all');

files = ["superMoon","lion"];
params = [[13,5,3];[12,4,2]];
orig_format_1 = "%s - Original LC";
sharp_format_1 = "%s - Sharp LC";
orig_format_2 = "%s - Original modifiedLC";
sharp_format_2 = "%s - Sharp modifiedLC";
file_path_format = "../data/%sCrop.mat";

for i = 1:2
    file = files(i);
    hsize = params(i,1);
    sigma = params(i,2);
    scale = params(i,3);
    image = load(sprintf(file_path_format, file)).imageOrig;
    image_sharp = myUnsharpMasking(image,hsize,sigma,scale);
    image_sharp_1 = myLinearContrastStretching(image_sharp);
    image_sharp_2 = imadjust(image_sharp);
    image_1 = myLinearContrastStretching(image);
    image_2 = imadjust(image);
    
    figure;
    subplot(2,2,1);
    imshow(image_1);
    colormap('Gray');
    title(sprintf(orig_format_1,file));
    colorbar;
    
    subplot(2,2,2);
    imshow(image_sharp_1);
    colormap('Gray');
    title(sprintf(sharp_format_1,file));
    colorbar;
    
    subplot(2,2,3);
    imshow(image_2);
    colormap('Gray');
    title(sprintf(orig_format_2,file));
    colorbar;
    
    subplot(2,2,4);
    imshow(image_sharp_2);
    colormap('Gray');
    title(sprintf(sharp_format_2,file));
    colorbar;
end

toc;

