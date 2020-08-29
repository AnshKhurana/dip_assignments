function [outImage] = findDerivative(inImage, a)
    % a=0 means x derivative and a=1 means y derivative
    if a==1
        inImage = transpose(inImage);
    end
    [m,n] = size(inImage) ;
    temp = zeros(m+2, n) ;
    temp(2:m+1,:) = inImage;
    temp(1,:) = 2*inImage(1,:) - inImage(2,:);
    temp(m+2,:) = 2*inImage(m,:) - inImage(m-1,:);
    outImage = (temp(3:m+2,:)-temp(1:m,:))/2 ;
    if a==1
        outImage = transpose(outImage);
    end
end