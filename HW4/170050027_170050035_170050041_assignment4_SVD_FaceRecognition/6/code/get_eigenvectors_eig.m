function [ eigenvecs ] = get_eigenvectors_eig( A,k )
%GET_EIGENVECTORS_EIG Summary of this function goes here
%   Detailed explanation goes here
    cov_matrix = A'*A;
    [V,D] = eig(cov_matrix);
    D = abs(D);
    [d, ind] = sort(diag(D),'descend');
    eigenvecs = V(:,ind(1:k));
    eigenvecs = A*eigenvecs;
    evec_lens = sqrt(sum(eigenvecs.^2,1));
    eigenvecs = bsxfun(@rdivide,eigenvecs,evec_lens);

end

