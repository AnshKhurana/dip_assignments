%% MyMainScript

tic;
%% Q6
% To detect whether an image at test time can be mapped to a person in 
% the train set, we can use the concept of thresholding. We can tune a
% threshold parameter believing that if the euclidean distance between the eigen
% coefficients (b/w test image and gallery image) is less than that threshold then the
% image is of a person seen during training. Otherwise, the decision is -
% person is not seen during training. Testing on the complete set of 32*4 +
% 8*10 images, taking k = 175, and tuning threshold to be 3000 (such that
% proportion of false negatives to actual positives is similar to
% proportion of false positives to actual negatives), we get the
% false_positives and false_negatives as below.
% 
% While the threshold value here has been manually tuned, given
% enough data, data can be partitioned into train, dev and test, instead of
% just train and test like we are doing now. Threshold can then be
% finetuned using dev set to minimize a metric on false positives and false
% negatives. The metric used here, as stated above, brings the fraction of
% false negatives to actutal positives close to fraction of false positives
% to total negatives.
% 
% Note: False positives here mean number of images of unseen persons whose eigencoeff
% distance with images of persons seen during training is less than threshold.
% False negatives means number of test images of persons seen during training,
% whose eigencoeff distance with train data was more than threshold.

[false_positive,false_negative] = frecog_adv(175,3000)
toc;
