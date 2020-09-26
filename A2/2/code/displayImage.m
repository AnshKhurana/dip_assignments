function displayImage(image, title_string)
    figure;
    myNumOfColors = 200;
    myColorScale = [[0:1/(myNumOfColors-1):1]', [0:1/(myNumOfColors-1):1]', [0:1/(myNumOfColors-1):1]'];
    title(title_string);
    hold on;
    imshow(image, [0, 255]);
    colormap (myColorScale);
    colorbar;
    daspect ([1 1 1]);
    axis tight;
    fig = gcf;
    truesize(fig,[400 400]);
    set(gcf,'units','centimeters','position',[0 0 16 16]);
end

% set(gcf, 'title', title_string);
