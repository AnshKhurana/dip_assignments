%% MyMainScript

tic;

%% Code for Q1.a

% Original circles image
figure;
im1 = imread("../data/circles_concentric.png");
title("Original image");
imshow(im1);

% Subsampled by 2 circles image
figure;
circles2 = myShrinkImageByFactorD(im1, 2);
title("Circles image subsampled by 2");
imshow(circles2);

% Subsampled by 3 circles image
figure;
circles3 = myShrinkImageByFactorD(im1, 3);
title("Circles image subsampled by 3");
imshow(circles3);

toc;

%% Code for Q1.b,c
% Original barbara image
figure;
im2 = imread("../data/barbaraSmall.png");
title("Original image");
imshow(im2);

% Currently using uint8 approximation to display the image, change later to
% display the color map and the double image properly
figure;
barbaraBilinear = uint8(myBilinearInterpolation(im2, 3, 2));
title("Bilinear Interpolated image");
imshow(barbaraBilinear);

% Nearest Neighbor Interpolation
figure;
barbaraNN = uint8(myNearestNeighborInterpolation(im2));
title("Nearest Neighbor Interpolated image");
imshow(barbaraNN);

toc;

%% Code for Q1.e
% Original barbara image
figure;
im2 = imread("../data/barbaraSmall.png");
title("Original image");
imshow(im2);

%Interpolated image
figure;
barbaraBicubic = uint8(myBicubicInterpolation(im2, 3, 2));
title("Bicubic Interpolation");
imshow(barbaraBicubic);

toc;


%% Code for Q1.f
% Original barbara image
figure;
im2 = imread("../data/barbaraSmall.png");
title("Original image");
imshow(im2);

%Rotated image
figure;
barbaraRotated = uint8(myImageRotation(im2, 30));
title("Rotated image");
imshow(barbaraRotated);

toc;
