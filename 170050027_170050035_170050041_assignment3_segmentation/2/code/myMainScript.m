%% MyMainScript

clc; clear all; close all;
warning('off', 'all');

tic;

%%  CS 663: Digital Image Processing, IIT Bombay (Autumn 2020)
% Aman Kansal, Ansh Khurana, Kushagra Juneja
%
% Assignment 3

%% Q2
%  Mean Shift Segmentation
%  run_per_img(), runs the transformations and calls myMeanShiftSegmentation
% for each image.
%  Code takes more than 5 minutes to run so the results have been saved in images/

%% baboon image
img = imread('../data/baboonColor.png');
h_s = 30;
h_r = 40;
runPerImage(img, h_s, h_r, 20, 'baboon');
toc;

%% bird image
img = imread('../data/bird.jpg');
h_s = 30;
h_r = 50;
runPerImage(img, h_s, h_r, 20, 'bird');
toc;

%% flower image
img = imread('../data/flower.jpg');
h_s = 30;
h_r = 40;
runPerImage(img, h_s, h_r, 20, 'flower');
toc;
