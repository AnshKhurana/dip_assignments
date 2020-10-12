%% CS 663 Assignment 3, Question 3
% Aman Kansal, Ansh Khurana, Kushagra Juneja

%% Code
clc; clear all; close all;
warning('off', 'all');

tic;

% im = imread('flower.jpg');
% n = size(im,1);
% m = size(im,2);
% [X,Y] = meshgrid(1:m,1:n);
% features = cat(3, im, X, Y);
% 
% L = imsegkmeans(features,3,'NormalizeInput',true);
% figure;
% imshow(L, [1 3]);
% mask = (L==3);
% dist = sqrt((X-m/2).^2 + (Y-n/2).^2);
% mask((dist<30)) = 1;
% mask((dist>100)) = 0;
% 
% figure;
% imshow(mask, [0 1]);

% --------------

im = imread('bird.jpg');
im = im(1:2:end, 1:2:end, :);

n = size(im,1);
m = size(im,2);
[X,Y] = meshgrid(1:m,1:n);
features = cat(3, im, X, Y);
L = imsegkmeans(features,3,'NormalizeInput',true);
mask = (L==2);
mask = bwareafilt(mask, 1);
mask = imfill(mask,'holes');
figure;
imshow(mask);


% --------------

im = imread('flower.jpg');

n = size(im,1);
m = size(im,2);
[X,Y] = meshgrid(1:m,1:n);
features = cat(3, im, X, Y);
L = imsegkmeans(features,3,'NormalizeInput',true);
mask = (L==3);
mask = bwareafilt(mask, 1);
mask = imfill(mask,'holes');
figure;
imshow(mask);

% toc;