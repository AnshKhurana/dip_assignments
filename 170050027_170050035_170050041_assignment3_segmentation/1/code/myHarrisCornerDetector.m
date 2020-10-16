function [f_x, f_y, lambda1, lambda2, corner] = myHarrisCornerDetector(im, sigma1, sigma2, k)
    W1 = ceil(sigma1*3);
    mask = fspecial('gaussian', [2*W1+1 2*W1+1], sigma1);
    im = imfilter(im, mask);
    
    W2 = ceil(sigma2*3);
    harris_mask = fspecial('gaussian', [2*W2+1 2*W2+1], sigma2);
    
    [f_x, f_y] = imgradientxy(im, 'sobel');
    Axx = imfilter(f_x.^2, harris_mask);
    Axy = imfilter(f_x.*f_y, harris_mask);
    Ayy = imfilter(f_x.^2, harris_mask);
    
    lambda1 = zeros(size(im)) ;
    lambda2 = zeros(size(im)) ;
    [m,n] = size(im);
    
    for i=1:m
        for j=1:n
            e = eig([Axx(i,j) Axy(i,j); Axy(i,j) Ayy(i,j)]);
            e = sort(e);
            lambda1(i,j) = e(2);
            lambda2(i,j) = e(1);
        end
    end
    
    corner = (Axx.*Ayy - Axy.^2) - k*((Axx+Ayy).^2);
end
