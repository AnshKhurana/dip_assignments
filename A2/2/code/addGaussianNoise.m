function [imOut] = addGaussianNoise(im, perc)
    std = (max(im(:)) - min(im(:)))*perc;
    noise = std*randn(size(im));
    imOut = im+noise;
end