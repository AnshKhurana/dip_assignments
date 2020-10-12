function displayMask(im, mask)
    displayImage(im, 'Original Image', 0, 255);
    displayImage(mask, 'Mask', 0, 1);
    mask3D = repmat(mask, 1, 1, 3);
    displayImage(im.*mask3D, 'Foreground', 0, 255);
    displayImage(im.*(1-mask3D), 'Background', 0, 255);
end