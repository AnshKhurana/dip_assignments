%% MyMainScript

clc; clear all; close all;
warning('off', 'all');

tic;

%% Code for Q1.a

% Original circles image
im1 = imread("../data/circles_concentric.png");
displayLockedAspectRatio(im1, "Original circles image");

% Subsampled by 2 circles image
circles2 = myShrinkImageByFactorD(im1, 2);
displayLockedAspectRatio(circles2, "Circles image subsampled by 2");

% Subsampled by 3 circles image
circles3 = myShrinkImageByFactorD(im1, 3);
displayLockedAspectRatio(circles3, "Circles image subsampled by 3");

toc;

%% Code for Q1.b,c,d
% Original barbara image
im2 = imread("../data/barbaraSmall.png");
displayLockedAspectRatio(im2, "Original image");

% Currently using uint8 approximation to display the image, change later to
% display the color map and the double image properly
barbaraBilinear = uint8(myBilinearInterpolation(im2, 3, 2));
displayLockedAspectRatio(barbaraBilinear, "Bilinear Interpolated image");

% Nearest Neighbor Interpolation
barbaraNN = uint8(myNearestNeighborInterpolation(im2));
displayLockedAspectRatio(barbaraNN, "Nearest Neighbor Interpolated image");

%Interpolated image
barbaraBicubic = uint8(myBicubicInterpolation(im2, 3, 2));
displayLockedAspectRatio(barbaraBicubic, "Bicubic Interpolation");

toc;

%% Code for Q1.f
% Original barbara image
im2 = imread("../data/barbaraSmall.png");
displayLockedAspectRatio(im2, "Original image");

%Rotated image
barbaraRotated = uint8(myImageRotation(im2, 30));
displayLockedAspectRatio(barbaraRotated, "Rotated image");

toc;