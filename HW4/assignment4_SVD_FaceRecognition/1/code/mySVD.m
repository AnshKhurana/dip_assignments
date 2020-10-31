function [U, S, V] = mySVD(A)
    [U, x] = eig(A * A');
    [V, x] = eig(A'* A);
    S = U' * A * V;
end
