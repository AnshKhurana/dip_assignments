function mySpatiallyVaryingKernel(im, mask, alpha)
    dist = bwdist(mask);
    r = dist.*(dist<=alpha) + alpha*(dist>alpha);
    displayImageJet(r, 'Variation of r', min(r(:)), max(r(:)));
    
    A = 0.2:0.2:1;
    for i=1:length(A)
        mask = fspecial('disk',A(i)*alpha);
        displayImageJet(mask, sprintf('Kernel at distance = %.1f*alpha', A(i)), 0, max(mask(:)));
    end
    
    out = im;
    [m, n, k] = size(im);
    padded_im = zeros(m+alpha*2, n+alpha*2, k);
    padded_im(1+alpha:m+alpha, 1+alpha:n+alpha, :) = im;
    
    bigmask = fspecial('disk',alpha);
    
    for i = 1+alpha:m+alpha
        for j = 1+alpha:n+alpha
            d = double(r(i-alpha, j-alpha));
            if d==0
                continue
            elseif d==alpha
                kernel = bigmask;
            else
                kernel = fspecial('disk',d);
            end
            
            [a,b] = size(kernel);
            a = int32((a-1)/2) ;
            b = int32((b-1)/2) ;

            kernel = repmat(kernel, 1, 1, 3);
            patch = padded_im(i-a:i+a, j-b:j+b, :);
            
            valid = repmat(sum(patch, 3)>0, 1, 1, 3);
            sumValid = sum(valid.*kernel, [1 2]);
            out(i-alpha,j-alpha,:) = sum(patch.*kernel, [1 2])./sumValid;
        end
    end
    
    displayImage(out, 'Spatially Varying Blurred Image', 0, 255);
end