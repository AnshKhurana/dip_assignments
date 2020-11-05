%% MyMainScript

tic;
%% Q6
% To detect whether an image at test time can be mapped to a person in 
% the test set, we can use the concept of thresholding. We can tune a
% threshold believing that if the euclidean distance between the eigen
% coefficients (b/w test and gallery) is less than that threshold then the
% image is of a person seen during training. Otherwise, the decision is
% person is not seen during training. Testing on the complete set of 40*4
% images, taking k = 175, and finetuning threshold to be 3000 (such that
% proportion of false negatives to actual positives is similar to
% proportion of false positives to actual negatives), we get the
% false_positives and false_negatives as below. False positives here mean
% number of images of unseen persons whose eigencoeff distance with images of
% persons seen during training is less than threshold. False negatives
% means number of test images of persons seen during training, whose
% eigencoeff distance with train data was more than threshold.

[false_positive,false_negative] = frecog_adv(175,3000)
toc;
