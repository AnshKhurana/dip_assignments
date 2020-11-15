%% MyMainScript
clc; clear all; close all;
warning('off', 'all');
tic;

%%  CS 663: Digital Image Processing, IIT Bombay (Autumn 2020)
%  Aman Kansal, Ansh Khurana, Kushagra Juneja
%
% Assignment 5
%% Q6: N point DFT of Laplacian Kernels

N=201;
%% Laplacian Filter K1
k1 = [0 1 0; 1 -4 1; 0 1 0];
disp('Laplacian Kernel Filter K1');
disp(k1);
ind_range = 100;
[U, V] = meshgrid(-ind_range:ind_range,-ind_range:ind_range);
%% Formula for computing DFT of K1, derivation given in report.
Fk1 = (-4+exp(-1j*2*pi*U/N)+exp(1j*2*pi*U/N) + exp(-1j*2*pi*V/N)+ exp(1j*2*pi*V/N));
lFK1 = log(abs(Fk1)+1);
figure(1); imshow(lFK1,[min(lFK1(:)) max(lFK1(:))]);
title('N-point DFT (log) of K1 shown using imshow'); truesize(figure(1),[400 400]); colormap('jet'); colorbar;
figure(2); surf(U, V, lFK1); title('N-point DFT of K1 shown using surf'); colormap('jet'); colorbar;

%% Laplacian Filter K2
k2 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
disp('Laplacian Kernel Filter K2');
disp(k2);

%% Formula for computing DFT of K2, derivation given in report.
Fk2 = 8-exp(-1j*2*pi*U/N)-exp(1j*2*pi*U/N)-exp(-1j*2*pi*V/N)-exp(1j*2*pi*V/N) ...
    - exp(-1j*2*pi*(U+V)/N)-exp(+1j*2*pi*(U+V)/N)-exp(-1j*2*pi*(U-V)/N)-exp(+1j*2*pi*(U-V)/N);
lFK2 = log(abs(Fk2)+1);
figure(3); imshow(lFK2,[min(lFK2(:)) max(lFK2(:))]); truesize(figure(3),[400 400]);
title('N-point DFT (log) of K2 shown using imshow'); colormap('jet'); colorbar;
figure(4); surf(U, V, lFK2); title('N-point DFT of K2 shown using surf'); colormap('jet'); colorbar;

%% Comments on DFT of the two kernels.
%
%
%  For DFT of k1, the values peak along diagonal axes, that is 45 degrees
% between x and y. Since the variation in the original kernel is more along
% the coordinate axes as compared to the diagonal axes (difference of 5 vs
% 4), in the DFT the variation comes out more along the diagonal axes.
%
%  The DFT of k2 is more symetrical since the original kernel is also more
% symmetrical. The higher frequency components in DFT of k2 have slightly
% higher magnitude when compared with DFT of k1. 
% Both these filters are high pass filters and can be used for sharperning
% the images. K2 seems to be a better filter for such sharpening since it
% cuts down the lower frequencies better and it is more isotropic in
% nature. 

toc;
