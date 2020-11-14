function [] = draw_circle(center, r)
xc = center(1);
yc = center(2);
t=0:0.1:2*pi;
%x_o and y_o = center of circle
x = xc + r*sin(t);
y = yc + r*cos(t);
plot(x,y,'r');
