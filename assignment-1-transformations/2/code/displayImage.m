function displayImage(image, title_string)
figure;
hold on;
imshow(image);
hold on;
title(title_string);
% set(gcf, 'title', title_string);

%  save(strcat('../results/1f_mems_',num2str(k) ,'.mat'), 'fig', '-mat');