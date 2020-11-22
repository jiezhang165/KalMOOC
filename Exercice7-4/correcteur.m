clear all;
clc;

n=1000;
xbar=[1;2];
Gx=[3,1;1,3];
b=randn(2,n);
figure(1)
x=xbar*ones(1,n)+sqrtm(Gx)*b;
%plot(x(1,:),x(2,:),'+b');
xm=mvnrnd(xbar,Gx,n)';
plot(xm(1,:),xm(2,:),'+b');
hold on;
draw_ellipse(xbar,Gx,0.9,'r',2);

x2=-10:10;
x1=1+1/3*(x2-2);
plot(x1,x2,'magenta','LineWidth',2);

x1=-10:10;
x2=2+1/3*(x1-2);
plot(x1,x2,'g','LineWidth',2);


