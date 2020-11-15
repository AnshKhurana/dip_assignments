clear;
clc;
[X,Y] = meshgrid(-128:128,-128:128);

u = 10.0001; v = 10.0001; N = 257; 
Z = exp(-1j*2*pi*(u*X+v*Y)/N); figure(1); imshow(Z/max(Z(:)));
FZ = fftshift(fft2(Z));
lFZ = log(abs(FZ)+1);
figure(2); imshow(lFZ,[min(lFZ(:)) max(lFZ(:))]); colormap('jet'); colorbar;
impixelinfo