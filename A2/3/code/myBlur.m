function [imOut] = myBlur(im)
    blur_mask = fspecial('gaussian', [5 5], 0.66);
    blurred_image= imfilter(im,blur_mask);
    imOut = blurred_image(1:2:end, 1:2:end);
end