function displayImage(image, title_string, filename)
figure;
imshow(image);
title(title_string);
fig = gcf;
save(strcat('../images/',filename,'.mat'), 'fig', '-mat');