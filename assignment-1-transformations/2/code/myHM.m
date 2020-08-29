function [matched_img] = myHM(input_image, reference_image)
% Perform histogram matching 
% CDF-1 ref image (CDF input image)


% map from I -> CDF(I)
input_cdf_transform = getCDFTransform(input_image);

ref_cdf_transform = getCDFTransform(reference_image);
assignin('base','ref_cdf_transform', ref_cdf_transform);
% invert reference CDF transform
ref_cdf_transform = [1; ref_cdf_transform];
inv_ref_cdf_transform = zeros(1, 256);
for i = 2:256
    % intensity range is 0-255
    % accomodate for not strict monotonous / binning 
    inv_ref_cdf_transform(ref_cdf_transform(i-1):ref_cdf_transform(i)) = i-1;
end
inv_ref_cdf_transform = [0, inv_ref_cdf_transform(1:255) ];
assignin('base','inv_ref_cdf_transform', inv_ref_cdf_transform);

% match input_cdf, ref_cdf
% +1 to map intensity->index
matched_img =  inv_ref_cdf_transform(input_cdf_transform(input_image+1)+1);
matched_img = uint8(matched_img);
% matched_img = mapInv(reference_image, )
