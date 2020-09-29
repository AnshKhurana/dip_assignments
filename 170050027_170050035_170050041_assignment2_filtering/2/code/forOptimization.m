function rmsd = forOptimization(x)
x(1) = max(0.00000001, x(1));
x(2) = max(0.00000001, x(2));
x
img = load('../data/barbara.mat');
img = im2double(img.imageOrig);
noisy = addGaussianNoise(img, 0.05);
denoised = myBilateralFiltering(noisy, x(1), x(2), 7);
rmsd = myRMSD(img, denoised)
end