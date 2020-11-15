clear;
load woman;

%X2 = padarray(X,[100 100],0);
X2 = X;
X3 = imrotate(X,30,'bilinear','crop');
figure; imshow(X2/max(X2(:)));
figure; imshow(X3/max(X3(:)));

FX2 = log(abs(fftshift(fft2(X2)))+1);
FX3 = log(abs(fftshift(fft2(X3)))+1);
figure; imshow(FX2,[min(FX2(:)) max(FX2(:))]); colormap('jet'); colorbar;
figure; imshow(FX3,[min(FX3(:)) max(FX3(:))]); colormap('jet'); colorbar;


