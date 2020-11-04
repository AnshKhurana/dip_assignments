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
%  Explanation of the method is given as comments in mySVD().
%  Running some examples for verififcation of algorithm:

disp('example 1')
A = eye(5);
demoSVD(A);
disp('example 2')
A = [ 2 3 5 7 ; 1 2 3 4 ; 1 3 4 2];
demoSVD(A);
disp('example 3')
A = [ 12 3 5 7 ; 1 2 3 4 ; 8 3 4 2];
demoSVD(A);
disp('example 4')
A = [ 1 2 3 4 5 6 ; 7 8 9 10 11 12; 13 14 15 16 17 18; 19 20 21 22 23 24];
demoSVD(A);

toc;
