function displayLockedAspectRatio(img, title_string, filename)
figure;
% hold on;
imshow(img, 'DisplayRange', [0, 255]);
daspect ([1 1 1]);
axis on;
title(title_string);
hold on;
% hold on;
colorbar;
fig = gcf;
save(strcat('../images/',filename,'.mat'), 'fig', '-mat');