%% MyMainScript

clc; clear all; close all;
warning('off', 'all');

tic;

%%  CS 663: Digital Image Processing, IIT Bombay (Autumn 2020)
% Aman Kansal, Ansh Khurana, Kushagra Juneja
%
% Assignment 4

%% Q1: Implementation of SVD using eig
%  demoSVD calls mySVD and shows the required values.


disp('example 1')
A = eye(5);
demoSVD(A);
disp('example 2')
A = eye(3,4);
demoSVD(A);
disp('example 3')
A = [ 2 3 5 7 ; 1 2 3 4 ; 1 3 4 2];
demoSVD(A);
toc;
