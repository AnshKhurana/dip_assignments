function [] = showBest(name, im, noisy_im, filtered_im, mask)

    displayImage(im, sprintf('Original %s image', name), 255);
    displayImage(noisy_im, sprintf('Noisy %s image', name), 255);
    displayImage(filtered_im, sprintf('Filtered %s image', name), 255);
    displayImage(mask, 'Isotropic mask', max(mask(:)));
    fprintf('RMSD of noisy image = %f\n', myRMSD(im, noisy_im));
    fprintf('RMSD of filtered image = %f\n', myRMSD(im, filtered_im));

end