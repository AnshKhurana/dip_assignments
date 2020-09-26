function [rmsd] = myRMSD(im1, im2)
    X = (im1-im2);
    X = X(:);
    X = X.^2 ;
    m = size(X, 1) ;
    rmsd = sqrt(sum(X)/m);
end