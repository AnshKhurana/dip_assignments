function displayImageKernel(image, title_string, minI, maxI)
    figure;
    myNumOfColors = 200;
    myColorScale = [[0:1/(myNumOfColors-1):1]', [0:1/(myNumOfColors-1):1]', [0:1/(myNumOfColors-1):1]'];
    title(title_string);
    hold on;
    imshow(image, [minI, maxI]);
    hold on;
    colormap (myColorScale);
    colorbar;
    daspect ([1 1 1]);
    axis tight;
    fig = gcf;
    truesize(fig,[400 400]);
    set(gcf,'units','centimeters','position',[0 0 16 16]);
end