function [U, S, V] = mySVD(A)
    [m, n] = size(A);
    %% Explanation
    % A = U*S*V'
    % AA' = U * S^2 * U'
    % AA'U = U*S^2
    % U = eig_vectors(AA')
    [U, eig1] = eig(A * A');
    [d, ind] = sort(diag(eig1), 'descend');
    eig1 = eig1(ind, ind);
    U = U(:, ind);
    % A = U*S*V'
    % A'A = V* S^2 * V'
    % AA'V = V*S^2
    % V = eig_vectors(A'A)
    [V, eig2] = eig(A'* A);
    [d, ind] = sort(diag(eig2), 'descend');
    eig2 = eig2(ind, ind);
    V = V(:, ind);
    
    % S^2 = eigen value matrix for AA' / A'A
    % Sort such that the eigen values correspond
    % Also, since A = U * S * V'
    % S = V * A * U'
    S = U' * A * V;
    
    % ensure that S has non-negative diagonal entries by switching signs of
    % columns of U

    for i = 1:min(m, n)
        if (S(i, i) < 0)
            U(:, i) = -U(:, i);
            S(i, i) = - S(i,i);
        end
    end
        
end
