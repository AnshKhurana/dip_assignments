function [best_i, best_s] = performGridSearch(img, img_name, sigma_intensity_range, sigma_spatial_range, window_size)
    noisy = addGaussianNoise(img, 0.05);
    old_min = 100;
    for si = sigma_intensity_range
        for ss = sigma_spatial_range
            denoised = myBilateralFiltering(noisy, si, ss, window_size);
            if  myRMSD(img, denoised) < old_min
                best_i = si;
                best_s = ss;
                old_min = myRMSD(img, denoised);
            end
%             fprintf('For image %s sigma_spatial = %f, sigma_intensity = %f, obtained RMSD = %f\n', img_name, ss, si, myRMSD(img, denoised));
        end
    end
end
