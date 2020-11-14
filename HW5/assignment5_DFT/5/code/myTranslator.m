function [] = myTranslator(I,J)
    F_I = fftshift(fft2(I));
    F_J = fftshift(fft2(J));
    
    Spectrum = (conj(F_I).*F_J)./(abs(F_I).*abs(F_J));
    impulse = ifft2(Spectrum);
    
    maxi = max(impulse(:));
    [X0,Y0] = find(impulse == maxi);
    fprintf("X0 = %d, Y0 = %d\n",X0,Y0);
    
    figure; imshow(I, [0,255]); title('Image I'); colorbar;
    figure; imshow(J, [0,255]); title('Image J'); colorbar;
    logS = log(abs(Spectrum)+1);
    figure; imshow(logS); title('Log Magnitude of Spectrum'); colormap('jet');colorbar;
    figure; imshow(impulse, [min(impulse(:)), max(impulse(:))]); title('Impulse');colorbar;

end