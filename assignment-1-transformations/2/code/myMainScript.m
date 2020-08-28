%% MyMainScript

tic;
%% Your code here
%% Q2 Main Script
%  CS 663: Digital Image Processing, IIT Bombay (Autumn 2020)
%  Aman Kansal, Ansh Khurana, Kushagra Juneja
clc; clear all; close all;
warning('off', 'all');
%% 2b.
%% 2c. 
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
