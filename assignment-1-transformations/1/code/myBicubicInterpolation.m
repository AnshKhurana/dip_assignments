function [outImage] = myBicubicInterpolation(inImage, r, c)
    % theta is in clockwise direction
    inImage = double(inImage);
    [m,n] = size(inImage);
    outImage = zeros(r*(m-1)+1,c*(n-1)+1);
    [m_, n_] = size(outImage);
    % find the derivative matrices
    f = inImage;
    fx = findDerivative(inImage, 0);
    fy = findDerivative(inImage, 1);
    fxy = findDerivative(fx, 1);
    T = double([1 0 0 0; 0 0 1 0; -3 3 -2 -1; 2 -2 1 1]);
    for i = 1:m_
       for j = 1:n_
          x = (i-1)/r + 1;
          y = (j-1)/c + 1;
          x0 = floor(x);
          if x0==m
              x0 = m-1;
          end
          x1 = x0+1;
          y0 = floor(y);
          if y0==n
              y0 = n-1;
          end
          y1 = y0+1;
          x = x-x0 ;
          y = y-y0 ;
          Xvec = [1 x x*x x*x*x];
          Yvec = [1 y y*y y*y*y];
          F = [f(x0,y0) f(x0,y1) fy(x0,y0) fy(x0,y1); 
              f(x1,y0) f(x1,y1) fy(x1,y0) fy(x1,y1); 
              fx(x0,y0) fx(x0,y1) fxy(x0,y0) fxy(x0,y1); 
              fx(x1,y0) fx(x1,y1) fxy(x1,y0) fxy(x1,y1)];
          A = T*F*transpose(T);
          val = Xvec*A*transpose(Yvec);
          outImage(i,j) = val;
       end
    end
end