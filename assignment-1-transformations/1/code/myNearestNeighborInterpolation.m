function [outImage] = myNearestNeighborInterpolation(inImage)
    %hardcoded for r=3,c=2
    r=3;
    c=2;
    [m,n] = size(inImage);
    outImage = zeros(r*(m-1)+1, c*(n-1)+1);
    outImage(1:r:end,1:c:end) = inImage;
    outImage(2:r:end,1:c:end) = inImage(1:end-1,:);
    outImage(3:r:end,1:c:end) = inImage(2:end,:);
    outImage(:,2:c:end) = outImage(:,1:c:end-1);
end