function displayJet(img, title_string, filename)
figure;
myNumOfColors = 200;
myColorScale = [[0:1/(myNumOfColors-1):1]', [0:1/(myNumOfColors-1):1]', [0:1/(myNumOfColors-1):1]'];
imshow(img, 'DisplayRange', [0, 255]);
colormap (myColorScale);
colormap jet;
daspect ([1 1 1]);
axis on;
hold on;
title(title_string);
colorbar;
fig = gcf;
truesize(fig,[400 400]);
set(gcf,'units','centimeters','position',[0 0 16 16]);
saveas(gcf, strcat('../images/',filename,'.png'));