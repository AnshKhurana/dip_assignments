function [outImage] = myBilinearInterpolation(inImage, r, c)
    inImage = double(inImage);
    [m,n] = size(inImage);
    outImage = zeros(r*(m-1)+1, c*(n-1)+1);
    outImage(1:r:end, 1:c:end) = inImage;
    % interpolating rows
    for i = 2:r
       outImage(i:r:end, 1:c:end) = ((r+1-i)/r)*inImage(1:end-1,:) + ((i-1)/r)*inImage(2:end,:);
    end
    % interpolating columns, hardcoded for c=2
    outImage(:,2:c:end) = outImage(:,1:c:end-1)/2+outImage(:,3:c:end)/2;
end