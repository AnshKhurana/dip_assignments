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
%% Grid Search
i_range = 10:2:30;
s_range = 0.3:0.1:1.5;
[sigma_intensity, sigma_spatial] = performGridSearch(img_barbara, 'Barbara', i_range, s_range, 7);

%% Best values
showBest(img_barbara, 'Barbara', sigma_intensity, sigma_spatial, 7)


%% Grass Image
img_grass = imread('../data/grass.png');
img_grass = im2double(img_grass);

%% Grid Search
i_range = 10:2:30;
s_range = 0.3:0.1:1.5;
[sigma_intensity, sigma_spatial] = performGridSearch(img_grass, 'Grass', i_range, s_range, 7);

%% Best values
showBest(img_grass, 'Grass', sigma_intensity, sigma_spatial, 7);

% HoneyComb image
img_honey = imread('../data/honeyCombReal.png');
img_honey = im2double(img_honey);

%% Grid Search
i_range = 10:2:30;
s_range = 0.3:0.1:1.5;
[sigma_intensity, sigma_spatial] = performGridSearch(img_honey, 'HoneyComb', i_range, s_range, 7);

%% Best values
showBest(img_honey, 'HoneyComb', sigma_intensity, sigma_spatial, 7);

toc;
