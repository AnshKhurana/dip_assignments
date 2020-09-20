function [mask, imOut] = myPatchBasedFiltering(im, h)
    mask = fspecial('gaussian', [9 9], 1.33);
    mask = mask / sum(mask(:));
    
    imOut = im ;
    
    shift = 16;
    window = 12;
    [m, n] = size(im);
    padded_im = zeros(m+shift*2, n+shift*2);
    padded_im(1+shift:m+shift, 1+shift:n+shift) = im;
    
    for i = 1+shift:m+shift
        for j = 1+shift:n+shift
            patch1 = padded_im(i-4:i+4, j-4:j+4);
            intensity_mat = padded_im(i-window:i+window, j-window:j+window);
            weights = zeros(2*window+1, 2*window+1);
            for x = -window:window
                for y = -window:window
                    patch2 = padded_im(i+x-4:i+x+4, j+y-4:j+y+4);
                    valid_mat = (patch2==0)&(patch1>0);
                    invalid = sum(valid_mat(:))>0 ;
                    if invalid
                        weights(x+window+1, y+window+1) = 0;
                        continue
                    end
                    diff = patch1-patch2 ;
                    diff = diff.*(patch1>0) ;
                    diff = diff.*diff ;
                    weighted_diff = diff.*mask;
                    weighted_diff = sum(weighted_diff(:)) ;
                    weights(x+window+1, y+window+1) = exp(-weighted_diff/(h*h));
                end
            end
            dot = intensity_mat.*weights ;
            imOut(i-shift, j-shift) = sum(dot(:)) / sum(weights(:));
        end
    end
end