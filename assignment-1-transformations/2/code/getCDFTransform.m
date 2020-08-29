function [pixel_transform] = getCDFTransform(input_image)
counts = imhist(input_image);
counts = cumsum(counts);
counts = uint8(255*counts/counts(end));
pixel_transform=counts;


