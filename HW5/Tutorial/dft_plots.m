clear;

A = dftmtx(8)';
A2 = kron(A,A);

cnt = 1;
 for i=1:8, 
     for j=1:8, 
         x = real(reshape(A2(:,(i-1)*8+j),8,8)); 
         if i > 1 && j > 1, x = (x-min(x(:)))/(max(x(:))-min(x(:))); end; 
         subplot(8,8,cnt); subimage(x/max(x(:))); 
         cnt = cnt+1; 
     end; 
 end;
 
figure(2); 
cnt = 1;
 for i=1:8, 
     for j=1:8, 
         X = zeros(8,8); X(i,j) = 1;
         x = real(ifft2(X));
         if i > 1 && j > 1, x = (x-min(x(:)))/(max(x(:))-min(x(:))); end;
         subplot(8,8,cnt); subimage(x/max(x(:))); 
         cnt = cnt+1; 
     end; 
 end;
 
 