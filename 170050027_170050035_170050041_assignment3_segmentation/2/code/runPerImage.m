function [] = runPerImage(img, h_s, h_r, num_epochs, img_name)

% original image 
displayImage(img, sprintf('Original image: %s', img_name), sprintf('original_%s.mat', img_name), 255);

% chosen values of h_s, h_r
fprintf("Chosen parameter for spatial bandwidth h_s = %f\n intensity bandwidth h_r = %f\n number of iterations = %d\n", h_s, h_r, num_epochs);

% Gaussian smooth and sub sample
sub_img = myBlur(img);
displayImage(sub_img, sprintf('Smoothed and subsampled image: %s', img_name), sprintf('subsampled_%s.mat', img_name), 255);

% Segment
segments = uint8(myMeanShiftSegmentation(sub_img, h_s, h_r, num_epochs, 0.4, 1000));
% assignin('base', 'segments', segments);
displayImage(segments, sprintf('Segmentation: %s', img_name), sprintf('segmentation_%s.mat', img_name), 255);
end