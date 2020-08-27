%% MyMainScript

tic;

%% Code for Q2.a
% Statue image
figure;
im2 = imread("../data/statue.png");
hold on;
title("Original image");
imshow(im2);

toc;

figure;
[mask, maskedImage] = myForegroundMask(im2);
hold on;
title("Mask");
imshow(mask);

toc;

figure;
hold on;
title("Masked image");
imshow(maskedImage);

toc;

%% Code for Q2.b
% Barbara image
figure;
im2 = imread("../data/barbara.png");
hold on;
title("Original image");
imshow(im2);

toc;

% Linear Contrast Stretching
figure;
contrastBarbara = uint8(myLinearContrastStretching(im2)) ;
title("Linear Contrast Stretching");
imshow(contrastBarbara);

toc;
%}
