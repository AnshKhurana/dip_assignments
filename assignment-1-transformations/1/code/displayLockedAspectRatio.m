function displayLockedAspectRatio(img, title_string)
figure;
% hold on;
imshow(img);
axis on;
hold on;
title(title_string);
daspect ([1 1 1]);
% hold on;
colorbar;