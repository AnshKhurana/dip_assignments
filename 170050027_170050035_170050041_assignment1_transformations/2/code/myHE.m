function he_image = myHE(src_image)
    img_size = size(src_image);
%     he_image = zeros(img_size);
%     for channel = 1:img_size(3)
        grey_image_component = src_image;
        grey_image_component_flat = grey_image_component(:);
%         intensity_histogram_vals = histogram(grey_image_component_flat,256).Values;
        intensity_histogram_vals = imhist(grey_image_component_flat);
        intensity_cdf = cumsum(intensity_histogram_vals);
        he_image_comp_flat = intensity_cdf(grey_image_component_flat+1)/sum(intensity_histogram_vals);
        he_image = reshape(he_image_comp_flat,img_size(1:2));
end
