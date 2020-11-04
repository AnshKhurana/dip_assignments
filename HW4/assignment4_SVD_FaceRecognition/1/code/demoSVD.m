function [] = demoSVD(A)
    disp('Original matrix A: ')
    disp(A);
    [U, S, V] = mySVD(A);
    disp('SVD done')
    toc;
    verify_A = U * S * V';
    disp('U: ')
    disp(U);
    disp('S: ')
    disp(S);
    disp('V: ')
    disp(V);
    %     disp('Singular values: ')
%     n = size(S);
%     n = min(n);
%     sorted = zeros(n,1);
%     for i = 1:n
%         sorted(i) = S(i,i);
%     end
%     sorted = sort(sorted, 'descend');
%     disp(sorted');
    disp("verify output by U * S * V'");
    disp(verify_A);
%     fprintf('\n');
%     disp("SVD computed from MATLAB function")
%     [U_s, S_s, V_s] = svd(A);
%     disp('U: ')
%     disp(U_s);
%     disp('S: ')
%     disp(S_s);
%     disp('V: ')
%     disp(V_s);
    
    fprintf('\n\n\n');
end
