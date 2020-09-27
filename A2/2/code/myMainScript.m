%% MyMainScript

clc; clear all; close all;
warning('off', 'all');

tic;

%%  CS 663: Digital Image Processing, IIT Bombay (Autumn 2020)
% Aman Kansal, Ansh Khurana, Kushagra Juneja
%
% Assignment 2

%%Q2
%  Edge-preserving Smoothing using Bilateral Filtering.
%  Assuming equal dimensions
%  The best values for the hyperparamters were calculated using grid
%  search, uncomment the grid search function call to perform the search.

%% Hyperparameters
%  Ranges represent the range in which grid search was performed.
window_size = 9;
i_range = 8:2:42;
s_range = 0.3:0.1:1.5;

%% Implementation
%  showBest and performGridSearch internally make calls to
% myBilateralFiltering which has the implementation of the algorithm.
%  We use images with intensities in range [0 255] and thus the
% corresponding RMSD values are according to this range.
%% Barbara image
img_barbara = load('../data/barbara.mat');
img_barbara = im2double(img_barbara.imageOrig);
%% Grid Search
% [sigma_intensity, sigma_spatial] = performGridSearch(img_barbara, 'Barbara', i_range, s_range, window_size);

%% Best values
sigma_intensity = 10;
sigma_spatial = 1.4;
showBest(img_barbara, 'Barbara', sigma_intensity, sigma_spatial, window_size)
toc;

%% Grass Image
img_grass = imread('../data/grass.png');
img_grass = im2double(img_grass)*255;

%% Grid Search
% [sigma_intensity, sigma_spatial] = performGridSearch(img_grass, 'Grass', i_range, s_range, window_size);

%% Best values
sigma_intensity = 42;
sigma_spatial = 0.8;
showBest(img_grass, 'Grass', sigma_intensity, sigma_spatial, window_size);
toc;
%% HoneyComb image
img_honey = imread('../data/honeyCombReal.png');
img_honey = im2double(img_honey)*255;

%% Grid Search
% [sigma_intensity, sigma_spatial] = performGridSearch(img_honey, 'HoneyComb', i_range, s_range, window_size);

%% Best values
sigma_intensity = 38;
sigma_spatial = 1;
showBest(img_honey, 'HoneyComb', sigma_intensity, sigma_spatial, window_size);
toc;