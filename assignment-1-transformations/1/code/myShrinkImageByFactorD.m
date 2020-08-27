function [outImage] = myShrinkImageByFactorD(inImage, D)
outImage = inImage(1:D:end,1:D:end);
end