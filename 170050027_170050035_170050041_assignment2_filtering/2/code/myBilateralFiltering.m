function [imOut] = myBilateralFiltering(im, sigma_intensity, sigma_spatial, window_size)
%     window_size = 6*sigma_spatial+1;
    [n, m] = size(im);
    imOut = zeros(m, n);
    pad = floor(window_size/2);
    padded_image = zeros(n+2*pad, m+2*pad);
    padded_image(pad+1:m+pad, pad+1:n+pad) = im;
    assignin('base', 'padded_image', padded_image);
    spatial_filter = fspecial('gaussian', [window_size, window_size], sigma_spatial);
    for i = 1:n
        for j = 1:m
            intensity_filter = getIntensityFilter(window_size, sigma_intensity, padded_image(pad+i, pad+j), padded_image(i:i+window_size-1,j:j+window_size-1));
            mask = intensity_filter.*spatial_filter;
            W_p = sum(mask(:));
            dot = padded_image(i:i+window_size-1,j:j+window_size-1) .* mask;
            imOut(i,j) = sum(dot(:)) / W_p;
        end
    end
end