function [mask] = myForegroundMask(im, k)
    n = size(im,1);
    m = size(im,2);
    [X,Y] = meshgrid(1:m,1:n);
    features = cat(3, im, X, Y);
    L = imsegkmeans(features,3,'NormalizeInput',true);
    mask = (L==k);
    mask = bwareafilt(mask, 1);
    mask = imfill(mask,'holes');
    mask = double(mask);
end