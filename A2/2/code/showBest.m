function [] = showBest(img, img_name, sigma_intensity, sigma_spatial, window_size)

%%  best filtered image
noisy = addGaussianNoise(img, 0.05);
displayImage(img, sprintf('Original %s image', img_name), 255);
displayImage(noisy, sprintf('%s image with Gaussian noise (RMSD=%f)',img_name, myRMSD(img, noisy)), 255);
denoised = myBilateralFiltering(noisy, sigma_intensity, sigma_spatial, window_size);
displayImage(denoised, sprintf('%s image with Bilateral Filtering (RMSD=%f)',img_name, myRMSD(img, denoised)), 255);
window_size = 6*sigma_spatial+1;
spatial_filter = fspecial('gaussian', [window_size, window_size], sigma_spatial);
displayImage(spatial_to_range, 'Visualization of the spatial gaussian filter', max(spatial_filter(:)));
end

