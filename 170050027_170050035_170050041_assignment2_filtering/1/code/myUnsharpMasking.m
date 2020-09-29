function sharp_image = myUnsharpMasking(F,hsize,sigma,scale)
    G = fspecial('gaussian',[2*hsize+1,2*hsize+1],sigma);
    GF = imfilter(F,G);
    sharp_image = F+ scale*(F-GF);
    F = myLinearContrastStretching(F);
    sharp_image = myLinearContrastStretching(sharp_image);
    
end