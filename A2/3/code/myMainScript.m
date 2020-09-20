%% MyMainScript

clc; clear all; close all;
warning('off', 'all');

tic;

%%  CS 663: Digital Image Processing, IIT Bombay (Autumn 2020)
% Aman Kansal, Ansh Khurana, Kushagra Juneja
%
% Assignment 2

% For grass image, h = 13.0 (with 1.33, blur)

% Barbara, h = 5.5 (with 1.33, blur)

% Honeycomb, h=14.5 (with 1.33, blur)

% Looks like sigma = 1.33 is quite low, use 2.0 once instead.

%% Code for Q3

im = imread("grass.png");
% im = load("barbara.mat").imageOrig;
im = double(im) ;
% im = myBlur(im);
noisy_im = myGaussianNoise(im);
h = 11.0;
[mask, filtered_im] = myPatchBasedFiltering(noisy_im, h);
noisy_rmsd = myRMSD(im, noisy_im) ;
rmsd = myRMSD(im, filtered_im) ;


figure;
title("Original Image");
imshow(uint8(im));

figure;
title("Noisy Image");
imshow(uint8(noisy_im));

figure;
title("Filtered Image");
imshow(uint8(filtered_im));

toc;
