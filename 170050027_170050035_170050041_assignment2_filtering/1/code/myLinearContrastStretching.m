function [outImage] = myLinearContrastStretching(inImage)
    inImage = double(inImage);
    % 0..1 range for double image
    inImage = inImage/255.0;
    [m,n,channels] = size(inImage);
    outImage = double(zeros(size(inImage))) ;
    for i=1:channels
        mini = min(min(inImage(:,:,i))) ;
        maxi = max(max(inImage(:,:,i))) ;
        outImage(:,:,i) = (inImage(:,:,i)-mini).*(1.0/(maxi-mini));
    end
end 