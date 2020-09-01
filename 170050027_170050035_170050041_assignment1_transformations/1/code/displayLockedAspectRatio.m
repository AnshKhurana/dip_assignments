function displayLockedAspectRatio(img, title_string, filename)
figure;
imshow(img, 'DisplayRange', [0, 255]);
daspect ([1 1 1]);
axis on;
hold on;
title(title_string);
colorbar;
fig = gcf;
truesize(fig,[400 400]);
set(gcf,'units','centimeters','position',[0 0 16 16]);
saveas(gcf, strcat('../images/',filename,'.png'));