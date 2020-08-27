%% MyMainScript

tic;

%% Code for Q1.a

% Original circles image
figure;
im1 = imread("../data/circles_concentric.png");
hold on;
title("Original image");
imshow(im1);

toc;

% Subsampled by 2 circles image
figure;
circles2 = myShrinkImageByFactorD(im1, 2);
hold on;
title("Circles image subsampled by 2");
imshow(circles2);

toc;

% Subsampled by 3 circles image
figure;
circles3 = myShrinkImageByFactorD(im1, 3);
hold on;
title("Circles image subsampled by 3");
imshow(circles3);

toc;

%% Code for Q1.b,c
% Original barbara image
figure;
im2 = imread("../data/barbaraSmall.png");
hold on;
title("Original image");
imshow(im2);

toc;

% Currently using uint8 approximation to display the image, change later to
% display the color map and the double image properly
figure;
barbaraBilinear = uint8(myBilinearInterpolation(im2, 3, 2));
hold on;
title("Bilinear Interpolated image");
imshow(barbaraBilinear);

toc;

% Nearest Neighbor Interpolation
figure;
barbaraNN = uint8(myNearestNeighborInterpolation(im2));
hold on;
title("Nearest Neighbor Interpolated image");
imshow(barbaraNN);

toc;

%% Code for Q1.d
% Original barbara image
figure;
im2 = imread("../data/barbaraSmall.png");
hold on;
title("Original image");
imshow(im2);

toc;

%Interpolated image
figure;
barbaraBicubic = uint8(myBicubicInterpolation(im2, 3, 2));
hold on;
title("Bicubic Interpolation");
imshow(barbaraBicubic);

toc;


%% Code for Q1.f
% Original barbara image
figure;
im2 = imread("../data/barbaraSmall.png");
hold on;
title("Original image");
imshow(im2);

toc;

%Rotated image
figure;
barbaraRotated = uint8(myImageRotation(im2, 30));
hold on;
title("Rotated image");
imshow(barbaraRotated);

toc;


