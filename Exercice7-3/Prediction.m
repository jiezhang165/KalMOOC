clear all;
clc;

n=1000;
b=randn(2,n);
figure(1)
scatter(b(1,:),b(2,:),'+','b');

Gx=[4,3;3,3];
xbar=[1;2];
x=xbar*ones(1,n)+sqrtm(Gx)*b;
figure(2)
scatter(x(1,:),x(2,:),'+','b');
moyen=[mean(x(1,:));mean(x(2,:))];
e=moyen-xbar;

figure(3)
hold on;
draw_ellipse(xbar,Gx,0.9,'r',2);
draw_ellipse(xbar,Gx,0.99,'blue',2);
draw_ellipse(xbar,Gx,0.999,'black',2);

dt=0.01;
A=[0,1;-1,0];
B=[2;3];
Ad=eye(2,2)+dt*A;
figure(4)
for t=0:dt:5;
    ud=dt*B*sin(t);
    x=Ad*x+ud*ones(1,n);
    clf; hold on; axis([-15 10 -15 10]);
    scatter(x(1,:),x(2,:),'+','b');
    xbar=Ad*xbar+ud;
    Gx=Ad*Gx*Ad';
    draw_ellipse(xbar,Gx,0.9,'black',2);
    drawnow();
end
    
    




