%% CS 663 Assignment 3, Question 3
% Aman Kansal, Ansh Khurana, Kushagra Juneja

%% Code
clc; clear all; close all;
warning('off', 'all');

tic;

%% Algorithm for foreground mask
% Use K means segmentation with features as RGB and spatial coordinates.
% I have used it with K=3 for both images. Then identify the label given 
% to maximum part of the object in foreground, lets say L. Now, first define a mask = 1
% if the pixel belongs to L, or else mask = 0. Currently the mask will have
% many connected components. So now, use 'bwareafilt' function of matlab
% to filter out the connected components with lesser pixels. Now, we will
% have only one connected component in the mask which actually represents the
% foreground object. But the mask will have some holes in it corresponding
% to some pixels which got labelled incorrectly by our segmentation
% algorithm. So now, use matlab function 'imfill' to fill these holes and
% get the correct mask.

%% Bird image
% We have downsampled the image by a factor of 2 on both axes. 
% Hence, the value of alpha used for this is also halved i.e. alpha = 20.

%% Code for bird image
im = imread('../data/bird.jpg');
im = im(1:2:end, 1:2:end, :);
mask = myForegroundMask(im, 2);
im = double(im);
displayMask(im, mask);
mySpatiallyVaryingKernel(im, mask, 20);

toc;

%% Flower image
% We have kept the image intact i.e. no downsampling. 
% Hence, alpha = 20.

%% Code for Flower image

im = imread('../data/flower.jpg');
mask = myForegroundMask(im, 3);
im = double(im) ;
displayMask(im, mask);
mySpatiallyVaryingKernel(im, mask, 20);

toc;