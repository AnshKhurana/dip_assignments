%% MyMainScript

clc; clear all; close all;
warning('off', 'all');

tic;

%%  CS 663: Digital Image Processing, IIT Bombay (Autumn 2020)
% Aman Kansal, Ansh Khurana, Kushagra Juneja
%
% Assignment 2

% For grass image, h = 13.5
% Noisy rmsd = 11.77, optimal rmsd = 7.35
% 0.9*h -> rmsd = 7.79
% 1.1*h -> rmsd = 7.52

% Barbara, h = 5.5
% Noisy rmsd = 4.73, optimal rmsd = 2.69
% 0.9*h -> rmsd = 2.74
% 1.1*h -> rmsd = 2.73

% Honeycomb, h = 15.0
% Noisy rmsd = 12.69, optimal rmsd = 7.54
% 0.9*h -> rmsd = 7.81
% 1.1*h -> rmsd = 7.75

%% Code for Q3

im = imread("honeyCombReal.png");
% im = load("barbara.mat").imageOrig;
im = double(im) ;
% im = myBlur(im);
noisy_im = myGaussianNoise(im);
h = 16.5;
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
