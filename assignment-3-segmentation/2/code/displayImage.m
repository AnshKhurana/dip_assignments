function displayImage(image, title_string, save_name, range)
    figure;
%     myNumOfColors = 200;
%     myColorScale = [[0:1/(myNumOfColors-1):1]', [0:1/(myNumOfColors-1):1]', [0:1/(myNumOfColors-1):1]'];
    title(title_string);
    hold on;

%     colormap (myColorScale);
%     colorbar;
    daspect ([1 1 1]);
    axis tight;
    imshow(image, [0, range]);
    hold on;
    fig = gcf;
    truesize(fig,[400 400]);
    set(gcf,'units','centimeters','position',[0 0 16 16]);
    hold on;
    
    fig = gcf;
    save(sprintf('../images/%s', save_name), 'fig', '-mat');
    hold off;
end
% set(gcf, 'title', title_string);
