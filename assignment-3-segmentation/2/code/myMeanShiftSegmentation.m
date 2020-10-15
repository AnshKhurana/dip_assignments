function [segmentation] = myMeanShiftSegmentation(img, h_s, h_r, num_epochs, step_size, N)

% init
[h,w,c] = size(img);
% segmentation = zeros(h,w,c);
intensity_points = reshape(img, [h*w, c]);
distance_points = zeros(h, w, 2);
% rows
distance_points(:, :, 1) = repmat([1:h]', 1, w);
% cols
distance_points(:, :, 2) = repmat([1:w], h, 1);
% assignin('base', 'coordinates', distance_points);
distance_points = reshape(distance_points, [h*w, 2]); 

% points in 5D space which need to be clustered
joint_features = zeros(h*w, c+2);
joint_features(:, 1:c) = intensity_points;
joint_features(:, c+1:c+2) = distance_points;


% gradient ascent along log(f)
for ep = 1:num_epochs
%     fprintf('epoch=%d\n', ep);
%     toc;
    neighbours =  knnsearch(joint_features, joint_features, 'K', N); 
%     size(neighbours)
    for idx = 1:h*w
        x_i = joint_features(idx, :);
        % find N nearest points 
        indices = neighbours(idx, :);
%         size(indices)
        
        feature_weights = exp(-sum(((joint_features(indices, 1:c) - repmat(x_i(1:c), N, 1) )/h_r).^2, 2));
        distance_weights = exp(-sum(((joint_features(indices, c+1:c+2) - repmat(x_i(c+1:c+2), N, 1) )/h_s).^2, 2));
%         size(feature_weights)
%         size(distance_weights)
        overall_weights = feature_weights .* distance_weights;
%         size(joint_features(indices, :))
        new_value = sum(repmat(overall_weights, 1, c+2) .* joint_features(indices, :), 1) / sum(overall_weights);
%         size(new_value)
        joint_features(idx, :) = new_value*step_size + x_i*(1-step_size);
    end
end
segmentation = reshape(joint_features(:, 1:c), [h,w,c]);
end