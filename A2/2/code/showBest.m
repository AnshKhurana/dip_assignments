function [] = showBest(img, img_name, sigma_intensity, sigma_spatial, window_size)

%%  best filtered image
% window_size = floor(window_size);
noisy = addGaussianNoise(img, 0.05);
displayImage(img, sprintf('Original %s image', img_name), 255);
displayImage(noisy, sprintf('%s image with Gaussian noise (RMSD=%f)',img_name, myRMSD(img, noisy)), 255);
denoised = myBilateralFiltering(noisy, sigma_intensity, sigma_spatial, window_size);
displayImage(denoised, sprintf('%s image with Bilateral Filtering (RMSD=%f)',img_name, myRMSD(img, denoised)), 255);
spatial_filter = fspecial('gaussian', window_size, sigma_spatial);
displayImage(spatial_filter, 'Visualization of the spatial gaussian filter', max(spatial_filter(:)));
fprintf('Optimal parameters: sigma_spatial = %f sigma_intensity = %f obtaining RMSD = %f\n', sigma_spatial, sigma_intensity, myRMSD(img, denoised));

denoised_spat_9 = myBilateralFiltering(noisy, sigma_intensity, 0.9*sigma_spatial, window_size);
fprintf('sigma_spatial*0.9 = %f,sigma_intensity = %f, obtained RMSD = %f\n', 0.9*sigma_spatial, sigma_intensity, myRMSD(img, denoised_spat_9));

denoised_spat_11 = myBilateralFiltering(noisy, sigma_intensity, 1.1*sigma_spatial, window_size);
fprintf('sigma_spatial*1.1 = %f,sigma_intensity = %f, obtained RMSD = %f\n', 1.1*sigma_spatial, sigma_intensity, myRMSD(img, denoised_spat_11));

denoised_i_9 = myBilateralFiltering(noisy, 0.9*sigma_intensity, sigma_spatial, window_size);
fprintf('sigma_spatial = %f,sigma_intensity*0.9 = %f, obtained RMSD = %f\n', sigma_spatial, 0.9*sigma_intensity, myRMSD(img, denoised_i_9));

denoised_i_11 = myBilateralFiltering(noisy, 1.1*sigma_intensity, sigma_spatial, window_size);
fprintf('sigma_spatial = %f,sigma_intensity*0.9 = %f, obtained RMSD = %f\n', sigma_spatial, 1.1*sigma_intensity, myRMSD(img, denoised_i_11));
end

