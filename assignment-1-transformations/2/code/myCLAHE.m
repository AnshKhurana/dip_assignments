function clahe_image = myCLAHE(src_image, k, h)
    img_size = size(src_image);
    h = round(h*(2*k+1)*(2*k+1))
    clahe_image = zeros(img_size);
%     for channel = 1:img_size(3)
        grey_image_component = src_image(:,:);
        
        
        for r = 1:img_size(1)
            for c = 1:img_size(2)
                clahe_window = grey_image_component(max(r-k,1):min(img_size(1),r+k),max(c-k,1):min(img_size(2),c+k));
                clahe_window_flat = clahe_window(:);
                clahe_hist = imhist(clahe_window_flat);
                
                overflowing_bins = clahe_hist>h;
                overflowing_weight = sum(clahe_hist(overflowing_bins));
                
                clahe_hist(clahe_hist>h) = h;
                clahe_hist = clahe_hist + overflowing_weight/256;
                
                clahe_cdf = cumsum(clahe_hist)/sum(clahe_hist);
                
                clahe_image(r,c) = clahe_cdf(src_image(r,c)+1);
        end
    end
    
        
end
