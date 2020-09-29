function [filter] = getIntensityFilter(window_size, sigma_intensity, I_x, neigh)
    ref_img = ones(window_size, window_size)*I_x;
%     size(ref_img)
%     size(neigh)
    sq_distance = (ref_img-neigh).^2 / (2*sigma_intensity*sigma_intensity);
    filter =  exp(-sq_distance) / (sigma_intensity * sqrt(2*pi));
end
