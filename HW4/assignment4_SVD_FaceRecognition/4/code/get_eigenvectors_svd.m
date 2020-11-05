function [ eigenvectors ] = get_eigenvectors_svd( A,k )
%GET_EIGENVECTORS_SVD Summary of this function goes here
%   Detailed explanation goes here
    [U,S,V] = svd(A,'econ');
    eigenvectors = U(:,1:k);

end

