function displayImage(image, title_string)
figure;
imshow(image);
title(title_string);
% set(gcf, 'title', title_string);
title(title_string);

%  save(strcat('../results/1f_mems_',num2str(k) ,'.mat'), 'fig', '-mat');