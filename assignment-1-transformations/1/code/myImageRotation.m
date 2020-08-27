function [outImage] = myImageRotation(inImage, theta)
    % theta is in clockwise direction
    [m,n] = size(inImage);
    outImage = zeros(m,n);
    cos_theta = cosd(theta);
    sin_theta = sind(theta);
    for i=1:m
        for j=1:n
            x = i-m/2;
            y = j-n/2;
            tempx = x*cos_theta - y*sin_theta;
            tempy = y*cos_theta + x*sin_theta;
            x = tempx + m/2 ;
            y = tempy + n/2 ;
            l = floor(x) ;
            r = l+1 ;
            d = floor(y);
            u = d+1 ;
            if l<1 || r>m || d<1 || u>n
                continue
            end
            outImage(i,j) = inImage(l,d)*(r-x)*(u-y)+inImage(l,u)*(r-x)*(y-d)+inImage(r,u)*(x-l)*(y-d)+inImage(r,d)*(x-l)*(u-y);
        end
    end
end