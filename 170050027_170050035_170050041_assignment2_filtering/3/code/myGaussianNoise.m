function [imOut] = myGaussianNoise(im)
    std = (max(im(:)) - min(im(:)))*0.05;
    noise = std*randn(size(im));
    imOut = im+noise;
end