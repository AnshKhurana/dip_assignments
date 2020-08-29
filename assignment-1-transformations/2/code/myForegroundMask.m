function [mask, maskedImage] = myForegroundMask(inImage)
    inImage = double(inImage);
    mask = (inImage>20);
    maskedImage = uint8(mask.*inImage);
    mask = double(mask)*255.0;
end