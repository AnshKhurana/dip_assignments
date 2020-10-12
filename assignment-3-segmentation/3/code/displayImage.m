function displayImage(image, title_string, minI, maxI)
    image = double(image);
    image = (image-minI)/(maxI-minI);
    figure;
    title(title_string);
    hold on;
    imshow(image, [minI, maxI]);
    hold on;
    daspect ([1 1 1]);
    axis tight;
    fig = gcf;
    truesize(fig,[400 400]);
    set(gcf,'units','centimeters','position',[0 0 16 16]);
end
