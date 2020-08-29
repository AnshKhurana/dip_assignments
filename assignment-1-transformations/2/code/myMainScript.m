%% MyMainScript

tic;

%% Code for Q2.a
% Statue image
figure;
im2 = imread("../data/statue.png");
title("Original image");
imshow(im2);

figure;
[mask, maskedImage] = myForegroundMask(im2);
title("Mask");
imshow(mask);

figure;
title("Masked image");
imshow(maskedImage);

toc;

%% Code for Q2.b
% Barbara image
figure;
im2 = imread("../data/barbara.png");
title("Original image");
imshow(im2);

% Linear Contrast Stretching
figure;
contrastBarbara = uint8(myLinearContrastStretching(im2)) ;
title("Linear Contrast Stretching");
imshow(contrastBarbara);

toc;
