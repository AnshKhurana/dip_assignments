%% CS 663 Assignment 3, Question 1
% Aman Kansal, Ansh Khurana, Kushagra Juneja

%% Tuned values
% sigma1 = 0.5 (for smoothing the image)
%
% sigma2 = 1.5 (for weighted averaging for structural tensor)
%
% k = 0.2

%% Code
clc; clear all; close all;
warning('off', 'all');

tic;

data = load('../data/boat.mat');
im = data.imageOrig;
im = double(im) ;
im = (im-min(im(:)))/(max(im(:)) - min(im(:)));

[f_x, f_y, lambda1, lambda2, corner] = myHarrisCornerDetector(im, 0.5, 1.5, 0.2) ;
displayImage(im, 'Boat', 0, 1);
displayImage(f_x, 'X derivative', -1, 1);
displayImage(f_y, 'Y derivative', -1, 1);
displayImage(lambda1, 'First Eigenvalue', 0, 1);
displayImage(lambda2, 'Second Eigenvalue', 0, 1);
displayImage(corner, 'Cornerness', 0, 1);

toc;