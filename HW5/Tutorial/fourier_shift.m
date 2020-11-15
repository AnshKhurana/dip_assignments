clear;
close all;
A = zeros(256);
B = A;
A(100:150,100:150) = 1;
B(160:210,170:220) = 1;

figure(1); imshow(A); figure(2); imshow(B);

FA = fftshift(fft2(A));
lFA = log(abs(FA)+1); figure(3); imshow(lFA,[min(lFA(:)) max(lFA(:))]); colormap('jet'); colorbar;
FB = fftshift(fft2(B));
lFB = log(abs(FB)+1); figure(4); imshow(lFB,[min(lFB(:)) max(lFB(:))]); colormap('jet'); colorbar;

FC = ((FA)'.*FB)./(abs(FA.*FB));
C = ifft2((FC));
figure; imshow(C/max(C(:)));
impixelinfo;