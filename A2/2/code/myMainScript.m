%% MyMainScript

clc; clear all; close all;
warning('off', 'all');

tic;

%%  CS 663: Digital Image Processing, IIT Bombay (Autumn 2020)
% Aman Kansal, Ansh Khurana, Kushagra Juneja
%
% Assignment 2

%%Q2
% Edge-preserving Smoothing using Bilateral Filtering.
% Assuming equal dimensions

%% Barbara image
img_barbara = load('../data/barbara.mat');
img_barbara = im2double(img_barbara.imageOrig);

%% Best values
sigma_intensity = 15;
sigma_spatial = 0.6;
showBest(img_barbara, 'Barbara', sigma_intensity, sigma_spatial, 7)
% noisy_barbara = addGaussianNoise(img_barbara, 0.05);
% 
% %%  best filtered image
% displayImage(img_barbara, 'Original barbara image');
% displayImage(noisy_barbara, sprintf('Barbara image with Gaussian noise (RMSD=%f)', myRMSD(img_barbara, noisy_barbara)));
% sigma_intensity = 15;
% sigma_spatial = 0.7;
% denoised_barbara = myBilateralFiltering(noisy_barbara, sigma_intensity, sigma_spatial, 7);
% displayImage(denoised_barbara, sprintf('Barbara image with Bilateral Filtering (RMSD=%f)', myRMSD(img_barbara, denoised_barbara)));
% window_size = 7;
% spatial_filter = fspecial('gaussian', [window_size, window_size], sigma_spatial);
% % max(spatial_filter(:))
% % spatial_to_range = spatial_filter*255;
% displayImage(spatial_filter, 'Visualization of the spatial gaussian filter', max(spatial_filter(:)));

%% Grass Image
img_grass = imread('../data/grass.png');
img_grass = double(img_grass);

%% Best values
sigma_intensity = 15;
sigma_spatial = 0.6;
showBest(img_grass, 'Grass', sigma_intensity, sigma_spatial, 7);
% 
% 
% img_honey = imread('../data/honeyCombReal.png');
% displayImage(img_honey, 'Original honey image');



toc;
