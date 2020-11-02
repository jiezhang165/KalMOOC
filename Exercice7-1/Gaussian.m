clear all;
Mx1 = -5:0.1:5; Mx2 = -5:0.1:5;
[X1,X2] = meshgrid(Mx1,Mx2);
[Y1,Y2] = meshgrid(Mx1,Mx2);
xbar=[1;2];

A=[cos(pi/6),-sin(pi/6);sin(pi/6),cos(pi/6)]*[1,0;0,3];
b=[-2;5];
ybar=A*xbar+b;
Gx=eye(2,2);
Gy=A*Gx*A';
invGx=inv(Gx);
invGy=inv(Gy);
dX1=X1-xbar(1);
dX2=X2-xbar(2);
dY1=Y1-xbar(1);
dY2=Y2-xbar(2);
Qx=invGx(1,1)*dX1.^2+2*(invGx(1,2)*dX1.*dX2)+invGx(2,2)*dX2.^2;
Qy=invGx(1,1)*dY1.^2+2*(invGy(1,2)*dY1.*dY2)+invGx(2,2)*dY2.^2;
Zx=1/(2*pi*sqrt(det(Gx)))*exp(-0.5*Qx);
Zy=1/(2*pi*sqrt(det(Gy)))*exp(-0.5*Qy);
figure(1)
contour3(X1,X2,Zx,10,'b');
surface(X1,X2,Zx);
figure(2)
contour3(Y1,Y2,Zy,10,'b');
surface(Y1,Y2,Zy);


